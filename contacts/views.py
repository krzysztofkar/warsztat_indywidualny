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

        address = Address.objects.get(pk=id)

        ctx = {"modified_person": modified_person,

               "address": address,

               }

        return render(request, "modify_person.html", ctx)


def modify_address_view(request, id):
    if request.method == "POST":
        id = int(id)
        modified_address = Address.objects.get(pk=id)
        city = request.POST.get('city')
        street_name = request.POST.get('street_name')
        house_number = request.POST.get('house_number')
        flat_number = request.POST.get('flat_number')

        modified_address.city = city
        modified_address.street_name = street_name
        modified_address.house_number = house_number
        modified_address.flat_number = flat_number
        modified_address.save()

        msg = "Address modified!"

        ctx = {"msg": msg,
               "address": modified_address
               }

        return render(request, "modify_person.html", ctx)