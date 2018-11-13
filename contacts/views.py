from django.shortcuts import render
from django.http import HttpResponse
from contacts.models import Person, Address, Phone, Email, Groups

# Create your views here.
def add_new_person_view(request):

    if request.method == "POST":

        name = request.POST.get('name')
        surname = request.POST.get('surname')
        description = request.POST.get('description')

        new_guy = Person.objects.create(name=name, surname=surname, description=description)

        msg = "New person added!"

        ctx = {"msg": msg,
               "new_guy": new_guy}

        return render(request, "add_new_person.html", ctx)


    elif request.method == "GET":

        return render(request, "add_new_person.html", {})


def modify_person_view(request, id):

    if request.method == "POST":

        modified_person = Person.objects.get(pk=id)
        name = request.POST.get('name')
        surname = request.POST.get('surname')
        description = request.POST.get('description')

        modified_person.name = name
        modified_person.surname = surname
        modified_person.description = description
        modified_person.save()

        msg = "Personal details modified!"

        ctx = {"msg": msg, "modified_person": modified_person}

        return render(request, "modify_person.html", ctx)

    elif request.method == "GET":

        id = int(id)
        modified_person = Person.objects.get(pk=id)

        ctx = {"modified_person": modified_person}

        return render(request, "modify_person.html", ctx)


