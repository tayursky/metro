from django import forms

# Форма поиска объекта для клиента
class SearchObjectFront(forms.Form):
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': 'Номер объекта'}), max_length=30, error_messages={'required': ''})

# Форма поиска метро для клиента
class SearchMetroFront(forms.Form):
    search = forms.CharField(label='', widget=forms.TextInput(attrs={'placeholder': 'Станция метро'}), max_length=30, error_messages={'required': ''})
