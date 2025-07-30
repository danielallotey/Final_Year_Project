class BusinessRegistrationData {
  // Step 1: Service Selection
  String? serviceType;

  // Step 2: Personal Info
  String? fullName;
  String? phone;
  String? email;
  String? password;

  // Step 3: Business Info Step 1
  String? businessName;
  String? businessType;
  String? category;

  // Step 4: Business Info Step 2 (Final)
  String? businessDescription;
  String? bizemail;
  String? phone2;
  String? location;
  String? address;

  BusinessRegistrationData({
    this.serviceType,
    this.fullName,
    this.phone,
    this.email,
    this.password,
    this.businessName,
    this.businessType,
    this.category,
    this.businessDescription,
    this.bizemail,
    this.phone2,
    this.location,
    this.address,
  });

  // Helper method to check if all required fields are filled
  bool get isComplete {
    return serviceType != null &&
        fullName != null &&
        phone != null &&
        email != null &&
        password != null &&
        businessName != null &&
        businessType != null &&
        category != null &&
        businessDescription != null &&
        bizemail != null &&
        location != null &&
        address != null;
  }

  // Helper method to get a formatted string representation
  @override
  String toString() {
    return '''
BusinessRegistrationData {
  serviceType: $serviceType,
  fullName: $fullName,
  phone: $phone,
  email: $email,
  password: ${password != null ? '[HIDDEN]' : 'null'},
  businessName: $businessName,
  businessType: $businessType,
  category: $category,
  businessDescription: $businessDescription,
  bizemail: $bizemail,
  phone2: $phone2,
  location: $location,
  address: $address,
  isComplete: $isComplete
}''';
  }

  // Method to convert to Map for Firestore
  Map<String, dynamic> toFirestoreMap() {
    return {
      'serviceType': serviceType,
      'fullName': fullName,
      'phone': phone,
      'email': email,
      'businessName': businessName,
      'businessType': businessType,
      'category': category,
      'businessDescription': businessDescription,
      'bizemail': bizemail,
      'phone2': phone2?.isNotEmpty == true ? phone2 : null,
      'location': location,
      'address': address,
    };
  }
}