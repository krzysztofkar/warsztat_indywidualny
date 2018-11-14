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

        emails = Email.objects.filter(person_id=id)
        email_types = Email.EMAIL_TYPES

        ctx = {
            "modified_person": modified_person,
            "address": address,
            "phone_number": phone_number,
            "phone_types": phone_types,
            "emails": emails,
            "email_types": email_types,

               }

        return render(request, "modify_person.html", ctx)


def modify_address_view(request, id):

    if request.method == "POST":

        id = int(id)

        modified_person = Person.objects.get(address_id=id)

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
               "address": modified_address,
               "modified_person": modified_person
               }

        return render(request, "add_address_response.html", ctx)


def delete_address_view(request, id):

    if request.method == "GET":

        id = int(id)
        address_to_delete = Address.objects.get(pk=id)
        address_to_delete.delete()

        msg = "Address deleted!"

        ctx = {"msg": msg,
               }

        return render(request, "standard_response.html", ctx)


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
        ctx = {'msg': msg, "address": new_address, "modified_person": modified_person}

        return render(request, "add_address_response.html", ctx)


def add_phone_view(request, id):

    if request.method == "POST":

        phone_number = request.POST.get("phone_number")
        phone_type = request.POST.get("phone_type")

        new_phone = Phone.objects.create(phone_number=phone_number, phone_type=phone_type, person_id=id)

        msg = "New Phone Added!"
        ctx = {"msg": msg,
               "new_phone": new_phone
               }

        return render(request, "add_phone_response.html", ctx)


def modify_phone_view(request, id):

    if request.method == "POST":

        phone_number = request.POST.get('phone_number')
        phone_type = request.POST.get('phone_type')

        modified_phone = Phone.objects.get(pk=id)

        modified_phone.phone_number = phone_number
        modified_phone.phone_type = phone_type
        modified_phone.save()

        modified_phone = Phone.objects.get(pk=id)

        msg = "Phone modified!"
        ctx = {'msg': msg,
               "new_phone": modified_phone
               }

        return render(request, "add_phone_response.html", ctx)


def delete_phone_view(request, id):

    if request.method == "GET":

        id = int(id)

        phone_to_delete = Phone.objects.get(pk=id)
        phone_to_delete.delete()
        # Person.objects.get(phone_id=id).delete()

        msg = "Phone deleted!"
        ctx = {"msg": msg}

        return render(request, "standard_response.html", ctx)


def add_email_view(request, id):

    if request.method == "POST":

        email = request.POST.get("email")
        email_type = request.POST.get("email_type")

        new_mail = Email.objects.create(email=email, email_type=email_type, person_id=id)

        msg = "New Mail Added!"
        ctx = {"msg": msg,
               "emails": new_mail}

        return render(request, "add_email_response.html", ctx)


def modify_email_view(request, id):

    if request.method == "POST":

        email = request.POST.get('email')
        email_type = request.POST.get('email_type')

        modified_email = Email.objects.get(pk=id)

        modified_email.email = email
        modified_email.email_type = email_type
        modified_email.save()
        modified_email = Email.objects.get(pk=id)

        msg = "Mail modified!"
        ctx = {'msg': msg,
               "emails": modified_email
               }

        return render(request, "add_email_response.html", ctx)


def delete_email_view(request, id):

    if request.method == "GET":

        id = int(id)

        email_to_delete = Email.objects.get(pk=id)
        email_to_delete.delete()

        msg = "Mail deleted!"
        ctx = {"msg": msg}

        return render(request, "standard_response.html", ctx)


def delete_person_view(request, id):

    if request.method == "GET":

        id = int(id)

        person_to_delete = Person.objects.get(pk=id)

        person_to_delete.address.delete()
        person_to_delete.delete()

        msg = "Person deleted!"
        ctx = {"msg": msg}

        return render(request, "standard_response.html", ctx)


def show_all_users_view(request):

    if request.method == "GET":

        users = Person.objects.all().order_by('surname', 'name')

        ctx = {"users": users}

        return render(request, "show_all_users.html", ctx)


def show_user_details_view(request, id):

    if request.method == "GET":

        person = Person.objects.get(pk=id)
        address_id = person.address_id

        if address_id is None:
            address = None
            phone = person.phone_set.all()
            email = person.email_set.all()

            ctx = {"person": person,
                   "address": address,
                   "phone": phone,
                   "email": email,
                   }

            return render(request, "show_user_details.html", ctx)

        address = Address.objects.get(id=address_id)

        phone = person.phone_set.all()
        email = person.email_set.all()

        ctx = {"person": person,
               "address": address,
               "phone": phone,
               "email": email,
        }

        return render(request, "show_user_details.html", ctx)


def add_group_view(request):

    if request.method == "POST":

        name = request.POST.get('name')
        group = Groups.objects.create(name=name)

        msg = "Group added!"
        ctx = {"msg": msg, "group": group}

        return render(request, "add_group.html", ctx)

    elif request.method == "GET":

        return render(request, "add_group.html", {})


def add_to_group_view(request, id):

    if request.method == "POST":

        user = Person.objects.get(pk=id)
        groups = request.POST.getlist('groups')

        user.groups_set.clear()

        user_groups = user.groups_set.all()

        for i in groups:
            group = Groups.objects.get(id=i)
            group.person.add(user)
            group.save()

        msg = "assigned to Groups:"

        ctx = {"user": user, "groups": groups, "user_groups": user_groups, "msg": msg}

        return render(request, "add_to_group.html", ctx)

    elif request.method == "GET":

        user = Person.objects.get(pk=id)
        groups = Groups.objects.all()
        user_groups = user.groups_set.all()

        ctx = {"groups": groups, "user": user, "user_groups": user_groups}

        return render(request, "add_to_group.html", ctx)

def show_all_groups_view(request):

    if request.method == "GET":

        groups = Groups.objects.all()
        group_users = groups.person_set.all()

        ctx = {"groups": groups, "group_users": group_users}

        return render(request, "show_all_groups.html", ctx)