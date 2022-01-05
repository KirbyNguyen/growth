import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:growth/models/growth_user.dart';

class UserDataSerivce {
  final CollectionReference growthUserCollection =
      FirebaseFirestore.instance.collection("GrowthUser");

  Future<void> updateGrowthUser(GrowthUser data) async {
    try {
      await growthUserCollection.doc(data.uid).set(data.toJson());
    } catch (error) {
      // print("Error in updateGrowthUser()");
      // print(error);

      rethrow;
    }
  }

  Future<GrowthUser> getGrowthUser(String uid) async {
    try {
      DocumentSnapshot result = await growthUserCollection.doc(uid).get();
      Map<String, dynamic> data = result.data() as Map<String, dynamic>;

      return GrowthUser.fromJson(data);
    } catch (error) {
      // print("Error in getGrowthUser()");
      // print(error);

      rethrow;
    }
  }

  Future<void> deleteGrowthUser(GrowthUser data) async {
    try {
      await growthUserCollection.doc(data.uid).set(data.toJson());
    } catch (error) {
      // print("Error in deleteGrowthUser()");
      // print(error);

      rethrow;
    }
  }
}
