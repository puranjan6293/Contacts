import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/contacts_model.dart';

// class ContactService {
//   final CollectionReference _contactsCollection =
//       FirebaseFirestore.instance.collection('users/user1/contacts');

//   Future<void> createContact(Contact contact) async {
//     await _contactsCollection.doc().set(contact.toJson());
//   }

//   Stream<List<Contact>> getContacts() {
//     return _contactsCollection.snapshots().map((querySnapshot) => querySnapshot
//         .docs
//         .map((doc) => Contact.fromJson(doc.data() as Map<String, dynamic>))
//         .toList());
//   }

//   Future<void> updateContact(Contact contact) async {
//     await _contactsCollection.doc(contact.id).update(contact.toJson());
//   }

//   Future<void> deleteContact(String id) async {
//     await _contactsCollection.doc(id).delete();
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';

class ContactService {
  final CollectionReference<Map<String, dynamic>> _contactsCollection =
      FirebaseFirestore.instance.collection('contacts');

  final User _user = FirebaseAuth.instance.currentUser!;

  Future<void> createContact(Contact contact) async {
    await _contactsCollection
        .doc(_user.uid)
        .collection('user_contacts')
        .doc(contact.id)
        .set(contact.toJson());
  }

  Stream<List<Contact>> getContacts() {
    return _contactsCollection
        .doc(_user.uid)
        .collection('user_contacts')
        .snapshots()
        .map((querySnapshot) => querySnapshot.docs
            .map((doc) => Contact.fromJson(doc.data()))
            .toList());
  }

  Future<void> updateContact(Contact contact) async {
    await _contactsCollection
        .doc(_user.uid)
        .collection('user_contacts')
        .doc(contact.id)
        .update(contact.toJson());
  }

  Future<void> deleteContact(String id) async {
    await _contactsCollection
        .doc(_user.uid)
        .collection('user_contacts')
        .doc(id)
        .delete();
  }
}
