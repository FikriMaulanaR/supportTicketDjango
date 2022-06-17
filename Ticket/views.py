from ast import If
from django.shortcuts import get_object_or_404, render, redirect, reverse
from .models import Ticket, TicketComment
from .forms import TicketForm, TicketCommentForm
from django.views.generic import DetailView
from django.contrib import messages
from django.contrib.auth.models import User
from django.core.paginator import Paginator
from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.views.generic import DeleteView
from django.contrib.auth.mixins import LoginRequiredMixin

# Create your views here.

def open_tickets(request):
    page = request.GET.get('page')
    t_open = Ticket.objects.filter(Status='Open').count()
    all_t = Ticket.objects.all().count()
    t_count = Ticket.objects.filter(Customer=request.user).count()
    open_tickets = Ticket.objects.filter(Status='Open').order_by('-Created_at')
    paginator = Paginator(open_tickets, 5)
    open_tickets = paginator.get_page(page)
    nums = "a" * open_tickets.paginator.num_pages
    context = {
        'title':'Open Tickets',
        'open_tickets':open_tickets,
        'nums':nums,
        't_open':t_open,
        'all_t':all_t,
        't_count':t_count
    }
    return render(request, 'active_tickets.html', context)


def all_tickets(request):
    if 'search' in request.GET and request.GET['search']:
        page = request.GET.get('page', 1)
        search_t = request.GET['search']
        all_tickets = Ticket.objects.filter(Q(Subject__icontains=search_t) | Q(Customer__first_name__icontains=search_t) | Q(Customer__last_name__icontains=search_t) | Q(Customer__username__icontains=search_t) | Q(Status__icontains=search_t) | Q(Level__icontains=search_t)).order_by('-Created_at').distinct()
        paginator = Paginator(all_tickets, 10)
        all_tickets = paginator.get_page(page)
        nums = "a" * all_tickets.paginator.num_pages
        t_count = Ticket.objects.filter(Customer=request.user).count()
        t_open = Ticket.objects.filter(Status='Open').count()
        all_t = Ticket.objects.all().count()
        context = {
            'title':'All Tickets',
            'all_tickets':all_tickets,
            'nums':nums,
            'search_t':search_t,
            't_count':t_count,
            't_open':t_open,
            'all_t':all_t
        }
        return render (request, 'all_tickets.html', context)
    else:
        page = request.GET.get('page')
        all_tickets = Ticket.objects.all().order_by('-Created_at')
        all_t = Ticket.objects.all().count()
        paginator = Paginator(all_tickets, 10)
        all_tickets = paginator.get_page(page)
        nums = "a" * all_tickets.paginator.num_pages
        t_count = Ticket.objects.filter(Customer=request.user).count()
        t_open = Ticket.objects.filter(Status='Open').count()
        context = {
            'title':'All Tickets',
            'all_tickets':all_tickets,
            'nums':nums,
            'all_t':all_t,
            't_count':t_count,
            't_open':t_open,
        }
        return render (request, 'all_tickets.html', context)


class TicketDeleteView(LoginRequiredMixin, DeleteView):
    model = Ticket
    template_name = 'delete_ticket.html'
    success_url = '/'
    success_message = "Ticket Deleted Successfully"

    def get(self, request, *args, **kwargs):
        messages.success(self.request, self.success_message)
        return super(TicketDeleteView, self).delete(request, *args, **kwargs)

def delete_comment(request, pk, id):
    comment = get_object_or_404(TicketComment, id=id)
    comment.delete()
    messages.info(request, "Comment Deleted Successfully")
    return redirect('detail-ticket', pk=pk)

@login_required(login_url='login')
def create_ticket(request):
    form = TicketForm()
    context = {
        'title' : 'Create Ticket',
        'form' : form,
    }

    if request.method == "POST":
        if request.user.is_authenticated:
            form = TicketForm(request.POST, request.FILES or None)

            for field in form:
                print(field.value())

            if form.is_valid():
                obj = form.save(commit=False)
                obj.Customer = User.objects.get(pk=request.user.id)
                obj.save()
                messages.success(request, "Ticket Created Successfully")
                return redirect('Dashboard')
            else:
                print(form.errors)
                messages.warning(request, (form.errors))
                return redirect('create-ticket')
        else:
            form = TicketForm()
        return render(request, 'create-ticket.html', {'form':form,'title':'Create Ticket'})
    return render(request, 'create_ticket.html', context)

@login_required(login_url='login')
def dashboard(request):
    page = request.GET.get('page')
    my_ticket = Ticket.objects.filter(Customer=request.user).order_by('-Created_at')
    paginator = Paginator(my_ticket, 5)
    my_ticket = paginator.get_page(page)
    nums = "a" * my_ticket.paginator.num_pages
    t_count = Ticket.objects.filter(Customer=request.user).count()
    t_open = Ticket.objects.filter(Status='Open').count()
    all_t = Ticket.objects.all().count()

    context = {
        'title' : 'Dashboard',
        'my_ticket' : my_ticket,
        't_count' : t_count,
        't_open' : t_open,
        'all_t' : all_t,
        'nums' : nums,
    }
    template_name : None    
    if request.user.is_authenticated:
        template_name = 'dashboard.html'
    else:
        template_name = 'login.html'
    return render(request, template_name, context)


class TicketDetailView(DetailView):
    model = Ticket
    template_name = 'detail_ticket.html'
    extra_context = {'title':'Ticket Details'}
    slug_field = "slug"
    count_hit = True

    form = TicketCommentForm

    def post(self, request, *args, **kwargs):
        form = TicketCommentForm(request.POST, request.FILES or None)
        if form.is_valid():
            ticket = self.get_object()
            form.instance.admin = request.user
            form.instance.ticket = ticket
            form.save()
            messages.success(request, "Comment Added Successfully")

            return redirect(reverse("detail-ticket", kwargs={'pk': ticket.id}))
        else:
            ticket = self.get_object()
            messages.warning(request, (form.errors))
            return redirect(reverse("detail-ticket", kwargs={'pk': ticket.id}))

    def get_context_data(self, **kwargs):
        ticket_comments_count = TicketComment.objects.all().filter(ticket=self.object.id).count()
        ticket_comments = TicketComment.objects.all().filter(ticket=self.object.id)
        context = super().get_context_data(**kwargs)
        context.update({
            'form': self.form,
            'ticket_comments': ticket_comments,
            'ticket_comments_count': ticket_comments_count,
        })
        return context
    
    def get_absolute_url(self):
        return reverse('detail-ticket', kwargs={'pk': self.pk})




def update_ticket(request, pk):
    ticket = Ticket.objects.get(pk=pk)
    form = TicketForm(instance=ticket)

    if request.method == "POST":
        if request.user.is_authenticated:
            form = TicketForm(request.POST, request.FILES, instance=ticket)

            for field in form:
                print(field.value())

            if form.is_valid():
                form.save()
                messages.success(request, "Ticket Updated Successfully")
                return redirect('Dashboard')
            else:
                print(form.errors)
                messages.warning(request, (form.errors))
                return redirect('update-ticket', pk)
    context = {
        'title':'Update Ticket',
        'form':form,
    }
    return render(request, 'update_ticket.html',context)

    #def get_context_data(self, **kwargs):
        #context = super().get_context_data(**kwargs)
        #context['form'] = self.get_form()
        #return 
    
    #def form_valid(self, form):
        #new_comment = form.save(commit=False)
        #new_comment.ticket = self.get_object()
        #return super(TicketDetailView, self).form_valid(form)