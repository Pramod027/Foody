import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:workshop/data/data_export.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/custom_field.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/custom_food_form_img.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/local_image_card.dart';
import 'package:workshop/presentation/app_screens/app_screens_widget/sub_ingredients_card.dart';
import 'package:workshop/shared/app_sized_box.dart';

class FoodForm extends StatefulWidget {
  final bool isUpdating;

  FoodForm({@required this.isUpdating});

  @override
  _FoodFormState createState() => _FoodFormState();
}

class _FoodFormState extends State<FoodForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List _subingredients = [];
  Food _currentFood;
  String _imageUrl;
  File _imageFile;
  TextEditingController subingredientController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);

    if (foodNotifier.currentFood != null) {
      _currentFood = foodNotifier.currentFood;
    } else {
      _currentFood = Food();
    }

    _subingredients.addAll(_currentFood.subIngredients);
    _imageUrl = _currentFood.image;
  }

  _showImage() {
    if (_imageFile == null && _imageUrl == null) {
      // return Text("image placeholder");
      return Text(" ");
    } else if (_imageFile != null) {
      print('showing image from local file');

      return LocalImageCard(
        imageFile: _imageFile,
        pressed: () async {
          File imageFile = await ImagePicker.pickImage(
              source: ImageSource.gallery, imageQuality: 50, maxWidth: 400);

          if (imageFile != null) {
            setState(() {
              _imageFile = imageFile;
            });
          }
        },
      );
    } else if (_imageUrl != null) {
      print('showing image from url');
    }
  }

  _buildSubingredientField() {
    return SizedBox(
      width: 200,
      child: TextField(
        controller: subingredientController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(labelText: 'Subingredient'),
        style: TextStyle(fontSize: 20),
      ),
    );
  }

  _onFoodUploaded(Food food) {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    foodNotifier.addFood(food);
    Navigator.pop(context);
  }

  _addSubingredient(String text) {
    if (text.isNotEmpty) {
      setState(() {
        _subingredients.add(text);
      });
      subingredientController.clear();
    }
  }

  _saveFood() {
    print('saveFood Called');
    if (!_formKey.currentState.validate()) {
      return;
    }

    _formKey.currentState.save();

    print('form saved');

    _currentFood.subIngredients = _subingredients;

    uploadFoodAndImage(
        _currentFood, widget.isUpdating, _imageFile, _onFoodUploaded);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          'Add products',
        ),
        leading: BackButton(
          color: Colors.grey,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(children: <Widget>[
            _showImage(),
            Text(
              widget.isUpdating ? "Edit Food" : " ", //"Create Food"
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            kShboxH12,
            _imageFile == null && _imageUrl == null
                ? CustomFoodFromImg(
                    image: 'assets/images/fast-food.svg',
                    pressed: () async {
                      File imageFile = await ImagePicker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 50,
                          maxWidth: 400);

                      if (imageFile != null) {
                        setState(() {
                          _imageFile = imageFile;
                        });
                      }
                    })
                : SizedBox(height: 0),
            CustomField(
              initialValue: _currentFood.category,
              saved: _currentFood.name,
              validator1: 'Name is required',
              validator2: 'Name must be more than 3 and less than 20',
              inputType: TextInputType.text,
              labelText: 'Name',
            ),
            kShboxH2,
            CustomField(
              initialValue: _currentFood.category,
              saved: _currentFood.category,
              validator1: 'Category is required',
              validator2: 'Name must be more than 3 and less than 20',
              inputType: TextInputType.text,
              labelText: 'Category',
            ),
            kShboxH6,
            CustomField(
              initialValue: _currentFood.description,
              saved: _currentFood.description,
              inputType: TextInputType.multiline,
              validator1: 'Description is required',
              validator2: 'Name must be more than 3 and less than 20',
              labelText: 'Description',
            ),
            CustomField(
              initialValue: _currentFood.price,
              saved: _currentFood.price,
              inputType: TextInputType.number,
              validator1: 'Price is required',
              validator2: 'Name must be more than 3 and less than 20',
              labelText: 'Price',
            ),
            CustomField(
              initialValue: _currentFood.rating,
              saved: _currentFood.rating,
              inputType: TextInputType.number,
              validator1: 'Rating is required',
              labelText: 'Rating',
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildSubingredientField(),
                ButtonTheme(
                  child: RaisedButton(
                    child: Text('Add', style: TextStyle(color: Colors.white)),
                    onPressed: () =>
                        _addSubingredient(subingredientController.text),
                  ),
                )
              ],
            ),
            kShboxH12,
            SubIngredientsCard(
              subIngridents: _subingredients,
            ),
          ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FocusScope.of(context).requestFocus(new FocusNode());
          _saveFood();
        },
        child: Icon(Icons.save),
        foregroundColor: Colors.white,
      ),
    );
  }
}
