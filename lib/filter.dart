import 'package:flutter/material.dart';
import 'package:recipe_app/app_colors.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<StatefulWidget> createState() {
    return _FilerState();
  }
}

class _FilerState extends State<Filter> {
  @override
  List<String> time = ['All', 'Newest', 'Oldest', 'Popular'];
  List<String> cetegories = [
    'All',
    'Indian',
    'Italian',
    'Asian',
    'Chineese',
    'Fruit',
    'Vegetables',
    'Protien',
    'Cereal',
    'Local dishes',
  ];

  int timeIndex = 0;
  int rateIndex = 0;
  int categoryIndex = 0;

  @override
  void initState() {
    super.initState();
    print('Init Called');
  }

  @override
  Widget build(BuildContext context) {
    print('Build called');
    final width = MediaQuery.of(context).size.width - 30;
    final height = MediaQuery.of(context).size.height;

    return Container(
      width: width + 30,
      height: (7 * height) / 10,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  'Filter Search',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Time',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Row(
                children: List.generate(time.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          timeIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: index == timeIndex
                              ? primary
                              : Colors.transparent,
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5,
                          ),
                          child: Text(
                            time[index],
                            style: TextStyle(
                              fontSize: 12,
                              color: index == timeIndex ? white : primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Text(
                'Rate',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Row(
                children: List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          rateIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(10),
                          color: index == rateIndex
                              ? primary
                              : Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5,
                          ),
                          child: Row(
                            children: [
                              Text(
                                '${index + 1}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: index == rateIndex ? white : primary,
                                ),
                              ),
                              Icon(
                                Icons.star,
                                color: index == rateIndex ? white : primary,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const Text(
                'Category',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Wrap(
                children: List.generate(cetegories.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          categoryIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: primary),
                          borderRadius: BorderRadius.circular(10),
                          color: categoryIndex == index
                              ? primary
                              : Colors.transparent,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 5,
                          ),
                          child: Text(
                            cetegories[index],
                            style: TextStyle(
                              fontSize: 12,
                              color: categoryIndex == index ? white : primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primary,
                    foregroundColor: white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 90,
                      vertical: 10,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  child: const Text('Filter'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
