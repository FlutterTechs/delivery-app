
import 'fileconsts.dart';

FirebaseAuth auth = FirebaseAuth.instance;
FirebaseFirestore firestore = FirebaseFirestore.instance;
User? currentUser = auth.currentUser;
var deliveryCollection = "deliveryBoys";
var orderCollection = "Orders";
