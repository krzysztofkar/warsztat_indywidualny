from django.shortcuts import render
from django.http import HttpResponse
from contacts.models import Person, Address, Phone, Email, Groups
from django.conf import settings
from os import path, rename, remove

# this is image processing library
from PIL import Image

# Create your views here.

def add_new_person_view(request):
    if request.method == "POST":
        name = request.POST.get('name')
        surname = request.POST.get('surname')
        description = request.POST.get('description')
        next = request.POST.get('next')
        if 'picture' in request.FILES:
            picture = request.FILES['picture']
            new_guy = Person.objects.create(name=name, surname=surname, description=description, picture=picture)

            # avatar will be 400px x 400px so we define min and max dimensions in px
            max_picture_width = 600
            min_picture_width = 400
            min_picture_height = 400
            max_picture_height = 600

            # check if this is an image and check required dimensions and file format
            full_path_to_file = settings.MEDIA_ROOT + str(new_guy.picture)

            # not all formats are fully supported by Pillow
            # perhaps there is more but no time to test it

            non_convertable_image_files = [".png", ".gif", ".nef", ".cr2", ".psd"]

            try:
                im = Image.open(full_path_to_file)
                picture_width = im.size[0]
                picture_height = im.size[1]
                if picture_width < min_picture_width or picture_height < min_picture_height:
                    e = "Picture should be at least 400px at width and height!"
                    im.close()
                    remove(full_path_to_file)
                    new_guy.delete()
                    return render(request, "standard_error_message.html", {"error_msg": e, 'next': next})
                filename, extension = path.splitext((str(new_guy.picture)).lower())
                if extension in non_convertable_image_files:
                    raise Exception
            except Exception as e:
                e = "This is not a supported image file. Allowed formats: jpg, tif, bmp."
                remove(full_path_to_file)
                new_guy.delete()
                return render(request, "standard_error_message.html", {"error_msg": e, 'next': next})

            # resize image, convert file to jpg
            ratio = picture_width / picture_height

            if picture_width > max_picture_width or picture_height > max_picture_height:
                if ratio > 1:
                    picture_height = min_picture_height
                    picture_width = picture_height * ratio
                else:
                    picture_width = min_picture_width
                    picture_height = picture_width / ratio

            picture_height = int(round(picture_height, 0))
            picture_width = int(round(picture_width, 0))

            filename, extension = path.splitext((str(new_guy.picture).lower()))
            im = im.resize((picture_width, picture_height))
            outfile = filename + ".jpg"

            if new_guy.picture != outfile:
                try:
                    im.save(settings.MEDIA_ROOT + outfile, "JPEG")
                    new_guy.picture = outfile
                    new_guy.save()
                except IOError as e:
                    print("This file can not be converted to jpg.")
                except Exception as e:
                    im.close()
                    return render(request, "standard_error_message.html", {"error_msg": e, 'next': next})
            else:
                im.save(settings.MEDIA_ROOT + outfile, "JPEG")
                new_guy.picture = outfile
                new_guy.save()

            im.close()

            # rename picture if name and surname were given
            if new_guy.name and new_guy.surname:
                filename, extension = path.splitext(str(new_guy.picture))
                new_picture_name = "avatar-" + new_guy.name + "-" + new_guy.surname + extension
                rename(settings.MEDIA_ROOT + str(new_guy.picture), settings.MEDIA_ROOT + new_picture_name)
                new_guy.picture = new_picture_name
                new_guy.save()
        else:
            new_guy = Person.objects.create(name=name, surname=surname, description=description)

        msg = "New person added!"
        ctx = {"msg": msg,
               "new_guy": new_guy,
               }
        return render(request, "add_new_person.html", ctx)

    elif request.method == "GET":
        return render(request, "add_new_person.html", {})


def modify_person_view(request, id):
    if request.method == "POST":

        modified_person = Person.objects.get(pk=id)
        name = request.POST.get('name')
        surname = request.POST.get('surname')
        description = request.POST.get('description')
        next = request.POST.get('next')

        if 'picture' in request.FILES:
            picture = request.FILES['picture']
            modified_person.name = name
            modified_person.surname = surname
            modified_person.description = description

            # avatar will be 400px x 400px so we define min and max dimensions in px
            max_picture_width = 600
            min_picture_width = 400
            min_picture_height = 400
            max_picture_height = 600

            non_convertable_image_files = [".png", ".gif", ".nef", ".cr2", ".psd"]

            try:
                im = Image.open(picture)
                picture_width = im.size[0]
                picture_height = im.size[1]
                if picture_width < min_picture_width or picture_height < min_picture_height:
                    e = "Picture should be at least 400px at width and height!"
                    im.close()
                    return render(request, "standard_error_message.html", {"error_msg": e, 'next': next})
                filename, extension = path.splitext((str(picture)).lower())
                if extension in non_convertable_image_files:
                    raise Exception
            except Exception as e:
                e = "This is not a supported image file. Allowed formats: jpg, tif, bmp."
                return render(request, "standard_error_message.html", {"error_msg": e, 'next': next})

            # resize image, convert file to jpg
            ratio = picture_width / picture_height

            if picture_width > max_picture_width or picture_height > max_picture_height:
                if ratio > 1:
                    picture_height = min_picture_height
                    picture_width = picture_height * ratio
                else:
                    picture_width = min_picture_width
                    picture_height = picture_width / ratio

            picture_height = int(round(picture_height, 0))
            picture_width = int(round(picture_width, 0))

            filename, extension = path.splitext((str(picture).lower()))
            im = im.resize((picture_width, picture_height))
            outfile = filename + ".jpg"

            if modified_person.picture != outfile:
                try:
                    im.save(settings.MEDIA_ROOT + outfile, "JPEG")
                    modified_person.picture = outfile
                    modified_person.save()
                except IOError as e:
                    print("This file can not be converted to jpg.")
                except Exception as e:
                    im.close()
                    return render(request, "standard_error_message.html", {"error_msg": e, 'next': next})
            else:
                im.save(settings.MEDIA_ROOT + outfile, "JPEG")
                modified_person.picture = outfile
                modified_person.save()

            im.close()

            # rename picture if name and surname were given
            if modified_person.name and modified_person.surname:
                filename, extension = path.splitext(str(modified_person.picture))
                new_picture_name = "avatar-" + modified_person.name + "-" + modified_person.surname + extension
                rename(settings.MEDIA_ROOT + str(modified_person.picture), settings.MEDIA_ROOT + new_picture_name)
                modified_person.picture = new_picture_name
                modified_person.save()
        else:
            modified_person.name = name
            modified_person.surname = surname
            modified_person.description = description
            modified_person.save()

        msg = "Personal details modified!"

        ctx = {"msg": msg, "modified_person": modified_person, 'next': next, }

        return render(request, "modify_person_response.html", ctx, )

    elif request.method == "GET":

        id = int(id)

        modified_person = Person.objects.get(pk=id)
        address_id = modified_person.address_id

        if address_id is None:
            address = None
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

            return render(request, "modify_person.html", ctx, )

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
        next = request.POST.get('next')

        modified_address.city = city
        modified_address.street_name = street_name
        modified_address.house_number = house_number
        modified_address.flat_number = flat_number
        modified_address.save()

        msg = "Address modified!"

        ctx = {"msg": msg,
               "address": modified_address,
               "modified_person": modified_person,
               "next": next,
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
        next = request.POST.get('next')

        id = int(id)
        new_address = Address.objects.create(city=city, street_name=street_name, house_number=house_number,
                                             flat_number=flat_number)
        modified_person = Person.objects.get(pk=id)
        modified_person.address_id = new_address.id
        modified_person.save()

        msg = "New Address Added"
        ctx = {'msg': msg, "address": new_address, "modified_person": modified_person, "next": next, }

        return render(request, "add_address_response.html", ctx)


def add_phone_view(request, id):
    if request.method == "POST":
        phone_number = request.POST.get("phone_number")
        phone_type = request.POST.get("phone_type")
        next = request.POST.get('next')

        new_phone = Phone.objects.create(phone_number=phone_number, phone_type=phone_type, person_id=id)
        phone_type = Phone.PHONE_TYPES
        new_phone = Phone.objects.get(pk=new_phone.id)

        msg = "New Phone Added!"
        ctx = {"msg": msg,
               "new_phone": new_phone,
               "phone_type": phone_type,
               "next": next,

               }

        return render(request, "add_phone_response.html", ctx)


def modify_phone_view(request, id):
    if request.method == "POST":
        phone_number = request.POST.get('phone_number')
        phone_type = request.POST.get('phone_type')
        next = request.POST.get('next')

        modified_phone = Phone.objects.get(pk=id)

        modified_phone.phone_number = phone_number
        modified_phone.phone_type = phone_type
        modified_phone.save()

        modified_phone = Phone.objects.get(pk=id)

        msg = "Phone modified!"
        ctx = {'msg': msg,
               "new_phone": modified_phone,
               "next": next,
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
        next = request.POST.get('next')

        new_mail = Email.objects.create(email=email, email_type=email_type, person_id=id)
        email_type = Email.EMAIL_TYPES
        new_mail = Email.objects.get(pk=new_mail.id)

        msg = "New Mail Added!"
        ctx = {"msg": msg,
               "emails": new_mail,
               "email_type": email_type,
               "next": next,
               }

        return render(request, "add_email_response.html", ctx)


def modify_email_view(request, id):
    if request.method == "POST":
        email = request.POST.get('email')
        email_type = request.POST.get('email_type')
        next = request.POST.get('next')

        modified_email = Email.objects.get(pk=id)

        modified_email.email = email
        modified_email.email_type = email_type
        modified_email.save()
        modified_email = Email.objects.get(pk=id)

        msg = "Mail modified!"
        ctx = {'msg': msg,
               "emails": modified_email,
               "next": next,
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

        if person_to_delete.address:
            person_to_delete.address.delete()
        if person_to_delete.picture:
            full_path_to_file = settings.MEDIA_ROOT + str(person_to_delete.picture)
            remove(full_path_to_file)
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
               "email": email
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
        # group_users = groups.person_set.all()

        ctx = {"groups": groups}

        return render(request, "show_all_groups.html", ctx)


def group_search_view(request):
    if request.method == "POST":
        name = request.POST.get('name')
        surname = request.POST.get('surname')

        search_user = Person.objects.filter(name__contains=name).filter(surname__contains=surname)

        msg = 'Search results.'

        ctx = {
            'msg': msg,
            'user': search_user,
        }

        return render(request, 'group_search.html', ctx)

    elif request.method == "GET":

        return render(request, 'group_search.html', {})


def delete_group_view(request, id):
    if request.method == "GET":
        id = int(id)
        group_to_delete = Groups.objects.get(pk=id)
        group_to_delete.delete()

        msg = "Group deleted!"

        ctx = {"msg": msg,
               }

        return render(request, "standard_response.html", ctx)


def delete_person_from_group_view(request, id, person_id):
    if request.method == "GET":
        id = int(id)
        person_id = int(person_id)
        group = Groups.objects.get(pk=id)
        person_to_delete = Person.objects.get(id=person_id)
        print(person_to_delete.name)
        group.person.remove(person_to_delete)

        msg = "Person removed from group."

        ctx = {"msg": msg,
               }

        return render(request, "standard_response.html", ctx)


def modify_group_view(request, id):
    if request.method == "POST":
        new_group_name = request.POST.get('name')

        modified_group = Groups.objects.get(pk=id)

        modified_group.name = new_group_name
        modified_group.save()

        modified_group = Groups.objects.get(pk=id)

        msg = "Group modified!"
        ctx = {'msg': msg,
               "group": modified_group
               }

        return render(request, "modify_group.html", ctx)

    if request.method == "GET":
        groups = Groups.objects.get(pk=id)

        ctx = {"group": groups}

        return render(request, "modify_group.html", ctx)
