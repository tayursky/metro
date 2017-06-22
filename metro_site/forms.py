from django import forms
from myobject.models import MyObject

# Форма поиска объекта для клиента
class SearchObjectFront(forms.Form):
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': 'Номер объекта'}), max_length=30, error_messages={'required': ''})

# Форма поиска метро для клиента
class SearchMetroFront(forms.Form):
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': 'Станция метро'}), max_length=30, error_messages={'required': ''})

#Форма поиска объекта по параметрам
class SearchObjFullFront(forms.Form):
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
