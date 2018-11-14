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

        return render(request, "modify_person_response.html", ctx)

    elif request.method == "GET":

        id = int(id)

        modified_person = Person.objects.get(pk=id)
        address_id = modified_person.address_id

        if address_id is None:
            ctx = {"modified_person": modified_person}

            return render(request, "modify_person.html", ctx)


        address = Address.objects.get(pk=address_id)
        phone_number = Phone.objects.filter(person_id=id)
        phone_types = Phone.PHONE_TYPES

        ctx = {"modified_person": modified_person,

               "address": address,
               "phone_number": phone_number,
               "phone_types": phone_types,

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

        return render(request, "modify_address_response.html", ctx)


def delete_address_view(request, id):

    if request.method == "GET":

        id = int(id)
        address_to_delete = Address.objects.get(pk=id)
        address_to_delete.delete()

        msg = "Address deleted!"

        ctx = {"msg": msg,
               }

        return render(request, "delete_address_response.html", ctx)


def add_address_view(request, id):

    if request.method == "POST":

        city = request.POST.get('city')
        street_name = request.POST.get('street_name')
        house_number = request.POST.get('house_number')
        flat_number = request.POST.get('flat_number')

        id = int(id)
        new_address = Address.objects.create(city=city, street_name=street_name, house_number=house_number, flat_number=flat_number)
        modified_person = Person.objects.get(pk=id)
        modified_person.address_id = new_address.id
        modified_person.save()

        msg = "New Address Added"
        ctx = {'msg': msg, "address": new_address}

        return render(request, "add_address_response.html", ctx)

def add_phone_view(request, id):

    if request.method == "POST":

        phone_number = request.POST.get("phone_number")
        phone_type = request.POST.get("phone_type")


        new_phone = Phone.objects.create(phone_number=phone_number, phone_type=phone_type, person_id=id)

        msg = "New Phone Added!"
        ctx = {"msg": msg}

        return request(request, "add_phone_response.html", ctx)

    # if request.method == "GET":

        # phone_types = Phone.PHONE_TYPES
        # print("PHONY", phone_types)

        # ctx = {"phone_types": phone_types}
        # return render(request, "modify_person.html", {})

# def modify_phone_view(request, id):
#
#     if request.method == "POST":
#
#         phone_number = request.POST.get('phone_number')
#         phone_type = request.POST.get('phone_type')



