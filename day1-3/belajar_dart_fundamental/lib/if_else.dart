void umur(int usia){
  if(usia < 17){
    print("Anda masih anak-anak");
  } else if(usia >= 17 && usia <= 25){
    print("Anda adalah remaja");
  } else if(usia > 25 && usia <= 40){
    print("Anda adalah orang dewasa");
  } else {
    print("Anda sudah tua");
  }
}