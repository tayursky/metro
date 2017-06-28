from django import forms

from myobject.models import MyObject
from myclient.models import Naznach, Okrug


class SearchObjectFront(forms.Form):
    ''' Форма поиска объекта для клиента '''
    search = forms.CharField(label='',
                             widget=forms.TextInput(
                                 attrs={'placeholder': 'Номер объекта'}),
                             max_length=30, error_messages={'required': ''})


class SearchMetroFront(forms.Form):
    ''' Форма поиска метро для клиента '''
    search = forms.CharField(label='',
                             widget=forms.TextInput(
                                 attrs={'placeholder': 'Станция метро'}),
                             max_length=30, error_messages={'required': ''})


class SearchObjFullFront(forms.Form):
    ''' Форма поиска объекта по параметрам '''
    REGION = (
        ('1', 'Центер и ТТК'),
        ('2', 'Север'),
        ('3', 'Юг'),
        ('4', 'Восток'),
        ('5', 'Запад'),
        ('6', 'Область')
    )
    PRICE = (
        ('1', '50000'),
        ('2', '100000'),
        ('3', '250000'),
        ('4', '500000'),
        ('5', '1000000'),
        ('6', '10000000'),
    )

    area_range = forms.ChoiceField(label='ПОМЕЩЕНИЕ',
                                   widget=forms.RadioSelect,
                                   choices=MyObject.RANGE_AREA)
    okrug = forms.ModelChoiceField(queryset=Okrug.objects.all(),
                                   empty_label=None,
                                   label='РАЙОН МОСКВЫ',
                                   widget=forms.RadioSelect)
    price = forms.ChoiceField(label='АРЕНДА В МЕСЯЦ до',
                              widget=forms.RadioSelect,
                              choices=PRICE)
    naznach = forms.ModelChoiceField(queryset=Naznach.objects.all(),
                                     empty_label='ВИД ДЕЯТЕЛЬНОСТИ',
                                     label='')
