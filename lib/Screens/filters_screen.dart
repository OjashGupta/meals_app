import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function savedFilters;
  final Map<String,bool> currentFilters;

  FilterScreen(this.currentFilters,this.savedFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactosefree = false;

  @override
  initState() {

    _glutenFree = widget.currentFilters['gluten']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactosefree = widget.currentFilters['lactose']!;
    _vegetarian = widget.currentFilters['vegetarian']!;

    super.initState();
  }

  Widget _buildCheckBoxListTile(String title, String description,
      bool currentValue, Function(bool?) updateValue) {
    return CheckboxListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed:() {
              final selectedFilters = {
                'gluten': _glutenFree,
                'vegan': _vegan,
                'lactose': _lactosefree,
                'vegetarian': _vegetarian,
              };
              widget.savedFilters(selectedFilters);},
            
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filters',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildCheckBoxListTile(
                  'Gluten-free',
                  'Only include gluten-free meals!',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue!;
                    });
                  },
                ),
                _buildCheckBoxListTile(
                  'Vegetarian',
                  'Only include Vegetarian meals!',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue!;
                    });
                  },
                ),
                _buildCheckBoxListTile(
                  'Vegan',
                  'Only include Vegan meals!',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue!;
                    });
                  },
                ),
                _buildCheckBoxListTile(
                  'Lactose-free',
                  'Only include Lactose-free meals!',
                  _lactosefree,
                  (newValue) {
                    setState(() {
                      _lactosefree = newValue!;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
