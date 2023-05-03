import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/contacts_model.dart';

import 'package:firebase_auth/firebase_auth.dart';

class ContactService {
  final CollectionReference<Map<String, dynamic>> _contactsCollection =
      FirebaseFirestore.instance.collection('contacts');

  final User _user = FirebaseAuth.instance.currentUser!;

  //Write
  Future<void> createContact(Contact contact) async {
    await _contactsCollection
        .doc(_user.uid)
        .collection('user_contacts')
        .doc(contact.id)
        .set(contact.toJson());
  }

  //read
  Stream<List<Contact>> getContacts() {
    return _contactsCollection
        .doc(_user.uid)
        .collection('user_contacts')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => Contact.fromJson(doc.data()))
            .toList());
  }

  //update
  Future<void> updateContact(Contact contact) async {
    await _contactsCollection
        .doc(_user.uid)
        .collection('user_contacts')
        .doc(contact.id)
        .update(contact.toJson());
  }

  //Delete
  Future<void> deleteContact(String id) async {
    await _contactsCollection
        .doc(_user.uid)
        .collection('user_contacts')
        .doc(id)
        .delete();
  }
}
