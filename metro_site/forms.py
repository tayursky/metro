from django import forms
from myobject.models import MyObject


class SearchObjectFront(forms.Form):
    ''' Форма поиска объекта для клиента '''
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': 'Номер объекта'}), max_length=30, error_messages={'required': ''})

class SearchMetroFront(forms.Form):
    ''' Форма поиска метро для клиента '''
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': 'Станция метро'}), max_length=30, error_messages={'required': ''})

class SearchObjFullFront(forms.Form):
    ''' Форма поиска объекта по параметрам '''
    PREMISE = (
        ('small', 'Маленькое до 20 кв.м.'),
        ('middle', 'Среднее от 20 до 80 кв.м.'),
        ('large', 'Большое до 80 кв.м.')
        )
    REGION = (
        ('1', 'Центер и ТТК'),
        ('2', 'Север'),
        ('3', 'Юг'),
        ('4', 'Восток'),
        ('5', 'Запад'),
        ('6', 'Область')
        )
    premise = forms.ChoiceField(label='ПОМЕЩЕНИЕ', widget=forms.RadioSelect, choices=PREMISE)
    region = forms.ChoiceField(label='РАЙОНЫ МОСКВЫ', widget=forms.RadioSelect, choices=REGION)
