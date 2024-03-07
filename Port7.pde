import java.util.Scanner;
import java.util.ArrayList;

Scanner in;
Button nextButton; 
Button previousButton;
ArrayList<Contact> contacts;
int liveContactIndex = 0;
int count = 0;

void setup() {
  size(450, 400);
  fill(0);
  textSize(20);

  contacts = new ArrayList<Contact>();
  in = InputReader.getScanner("C:\\Users\\Peter\\Documents\\Port7\\Contacts.csv");
  
  while (in.hasNextLine()) {
    String line = in.nextLine();
    if (count == 0) {
      count = count + 1;
      continue;
    }
    String[] currentLine = line.split(",");

    String firstName = currentLine[0];
    String lastName = currentLine[1];
    String email = currentLine[2];
    String phoneNumber = currentLine[3];
    
    Contact contact = new Contact(firstName, lastName);
    contact.setEmail(email);
    contact.setPhone(phoneNumber);
    contacts.add(contact);
  }

  nextButton = new Button(60, 300, 100, 40);
  previousButton = new Button(300, 300, 100, 40);

  nextButton.setLabel("Next");
  previousButton.setLabel("Previous");
}

void draw() {
  background(255);
  nextButton.display();
  previousButton.display();

  if (contacts.size() > 0) {
    Contact contact = contacts.get(liveContactIndex);
    text("First Name: " + contact.firstName, 70, 100);
    text("Last Name: " + contact.lastName, 70, 150);
    text("Email: " + contact.email, 70, 200);
    text("Phone: " + contact.phNum, 70, 250);
  }
}

void mousePressed() {
  if (nextButton.isWithinBounds(mouseX, mouseY)) {
    liveContactIndex--;
    if (liveContactIndex < 0) {
      liveContactIndex = contacts.size() - 1; 
    }
  } else if (previousButton.isWithinBounds(mouseX, mouseY)) {
    liveContactIndex++;
    if (liveContactIndex >= contacts.size()) {
      liveContactIndex = 0;
    }
  }
}
