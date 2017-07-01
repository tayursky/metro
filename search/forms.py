from django import forms


class SearchObject(forms.Form):
    '''Форма поиска объекта'''
    search = forms.CharField(label='Поиск объекта',
                             widget=forms.TextInput(
                                 attrs={'placeholder': 'Номер объекта'}),
                             max_length=30, error_messages={'required': ''})


class SearchAdres(forms.Form):
    '''Форма поиска объекта по одресу'''
    search = forms.CharField(label='Поиск по адресу',
                             widget=forms.TextInput(
                                 attrs={'placeholder': 'Адрес'}),
                             max_length=30, error_messages={'required': ''})


class SearchClient(forms.Form):
    '''Форма поиска клиента'''
    search = forms.CharField(label='Поиск клиента',
                             widget=forms.TextInput(
                                 attrs={'placeholder': 'Имя, email, тел.'}),
                             max_length=30, error_messages={'required': ''})


class SearchMetro(forms.Form):
    '''Форма поиска метро'''
    search = forms.CharField(label='Поиск по метро',
                             widget=forms.TextInput(
                                 attrs={'placeholder': 'Станция метро'}),
                             max_length=30, error_messages={'required': ''})


class SearchVlad(forms.Form):
    '''Форма поиска по собственику'''
    search = forms.CharField(label='Поиск по владельцу',
                             widget=forms.TextInput(
                                 attrs={'placeholder': 'Тел. или имя'}),
                             max_length=30, error_messages={'required': ''})
