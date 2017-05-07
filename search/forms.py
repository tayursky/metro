from django import forms

#Форма поиска клиента
class SearchClient(forms.Form):
    search = forms.CharField(label='Поиск клиента', max_length=10)
