import 'package:flutter/material.dart';

class DireccionesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        _itemLista(),
        _itemLista(),
        _itemLista(),
        _itemLista(),
        _itemLista(),
        _itemLista(),
        _itemLista(),
        _itemLista(),
        _itemLista(),
        _itemLista(),
        _itemLista(),
      ],
    );
  }

  //Listas De elementos
  Widget _itemLista() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      color: Color.fromRGBO(44, 44,44, 1.0),
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
          color:Color.fromRGBO(39, 174, 96,1.0),
        ),
        secondaryBackground: Container(
          color: Color.fromRGBO(231, 76, 60,1.0),
        ),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Color.fromRGBO(88, 44,44, 1.0),
            backgroundImage: NetworkImage(
                'https://i.pinimg.com/originals/e1/dc/76/e1dc769a64a1cc6d044489d9764ae3b9.png'),
          ),
          title: Text('Hola Chicos soy FLutter'),
          subtitle: Text(
            'soy un sub title, de mi primera app de flutter esto es hermosos como el amor de dios',
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Icon(Icons.keyboard_tab),
          onTap: () {
            print('Hola soy tu terminal');
          },
          dense: false,
        ),
      ),
    );
  }
}
