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

        city = request.POST.get('city')
        street_name = request.POST.get('street_name')
        house_number = request.POST.get('house_number')
        flat_number = request.POST.get('flat_number')

        new_address = Address.objects.create(
            city=city,
            street_name=street_name,
            house_number=house_number,
            flat_number=flat_number
        )

        msg = "Personal details modified!"

        ctx = {"msg": msg,
               "modified_person": modified_person
               }

        return render(request, "modify_person.html", ctx)


    elif request.method == "GET":

        id = int(id)
        modified_person = Person.objects.get(pk=id)
        address = modified_person.address


        ctx = {"modified_person": modified_person,
               "address": address
               }

        return render(request, "modify_person.html", ctx)

