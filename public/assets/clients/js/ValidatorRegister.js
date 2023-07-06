

// function validateForm() {
//     let name = document.getElementById("InputName").value.trim();
//     let email = document.getElementById("InputEmail2").value.trim();
//     let password = document.getElementById("InputPassword2").value.trim();
//     let confirmPassword = document.getElementById("InputConfirmPassword").value.trim();
//     let errors = [];

//     if (name === "") {
//         errors.push("Please enter your full name");
//         document.getElementById("nameError").textContent = "Please enter your full name";
//     } else if (!/^[a-zA-Z ]+$/.test(name)) {
//         errors.push("Name can only contain letters and spaces");
//         document.getElementById("nameError").textContent = "Name can only contain letters and spaces";
//     } else {
//         document.getElementById("nameError").textContent = "";
//     }

//     if (email === "") {
//         errors.push("Please enter your email");
//         document.getElementById("emailError").textContent = "Please enter your email";
//     } else if (!/^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$/.test(email)) {
//         errors.push("Invalid email format");
//         document.getElementById("emailError").textContent = "Invalid email format";
//     } else {
//         document.getElementById("emailError").textContent = "";
//     }

//     if (password === "") {
//         errors.push("Please enter a password");
//         document.getElementById("passwordError").textContent = "Please enter a password";
//     } else if (password.length < 8) {
//         errors.push("Password must be at least 8 characters long");
//         document.getElementById("passwordError").textContent = "Password must be at least 8 characters long";
//     } else if (!/\d/.test(password)) {
//         errors.push("Password must contain at least one number");
//         document.getElementById("passwordError").textContent = "Password must contain at least one number";
//     } else if (!/[!@#$%^&*(),.?":{}|<>]/g.test(password)) {
//         errors.push("Password must contain at least one special character");
//         document.getElementById("passwordError").textContent =
//             "Password must contain at least one special character";
//     } else {
//         document.getElementById("passwordError").textContent = "";
//     }

//     if (confirmPassword === "") {
//         errors.push("Please confirm your password");
//         document.getElementById("confirmPasswordError").textContent = "Please confirm your password";
//     } else if (confirmPassword !== password) {
//         errors.push("Passwords do not match");
//         document.getElementById("confirmPasswordError").textContent = "Passwords do not match";
//     } else {
//         document.getElementById("confirmPasswordError").textContent = "";
//     }

//     if (errors.length > 0) {
//         return false;
//     } else {
//         return true;
//     }
// }
