from django import forms

# Форма поиска объекта
class SearchObject(forms.Form):
    search = forms.CharField(label='Поиск объекта', widget=forms.TextInput(attrs={'placeholder': 'Номер объекта'}), max_length=30, error_messages={'required': ''})

# Форма поиска объекта по одресу
class SearchAdres(forms.Form):
    search = forms.CharField(label='Поиск по адресу', widget=forms.TextInput(attrs={'placeholder': 'Адрес'}), max_length=30, error_messages={'required': ''})

# Форма поиска клиента
class SearchClient(forms.Form):
    search = forms.CharField(label='Поиск клиента', widget=forms.TextInput(attrs={'placeholder': 'Имя, email, тел.'}), max_length=30, error_messages={'required': ''})

# Форма поиска метро
class SearchMetro(forms.Form):
    search = forms.CharField(label='Поиск по метро', widget=forms.TextInput(attrs={'placeholder': 'Станция метро'}), max_length=30, error_messages={'required': ''})

# Форма поиска по собственику
class SearchVlad(forms.Form):
    search = forms.CharField(label='Поиск по владельцу', widget=forms.TextInput(attrs={'placeholder': 'Тел. или имя'}), max_length=30, error_messages={'required': ''})
