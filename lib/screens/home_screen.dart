import 'package:flutter/material.dart';

import '../models/doctor.dart';
import '../utils/data_store.dart';


class HomeScreen extends StatelessWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 7/10
            ),
            itemCount: DataStore.doctors.length,
            itemBuilder: (context, index){

              Doctor doctor = DataStore.doctors[index];
              return Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.asset(doctor.photo, width: 100, height: 100,
                          fit: BoxFit.cover,)),
                    Text(doctor.name, style: const TextStyle(fontSize: 20, fontStyle: FontStyle.italic),),
                    Text(doctor.spe, style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),),
                    Text(doctor.clinicAddress, style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),),
                    Text('Fee: Rs. ${doctor.fee}', style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),)
                  ],
                ),
              );

            }),
      ),
    );
  }
}
