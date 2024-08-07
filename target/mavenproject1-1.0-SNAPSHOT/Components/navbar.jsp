<%
    String userType1= (String)session.getAttribute("userType");
%>

<!-- Topbar Start -->
    <div class="container-fluid py-2 border-bottom d-none d-lg-block">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-lg-start mb-2 mb-lg-0">
                    <div class="d-inline-flex align-items-center">
                        <a class="text-decoration-none text-body pe-3" href=""><i class="bi bi-telephone me-2"></i>+012 345 6789</a>
                        <span class="text-body">|</span>
                        <a class="text-decoration-none text-body px-3" href=""><i class="bi bi-envelope me-2"></i>info@example.com</a>
                    </div>
                </div>
                
            </div>
        </div>
    </div>
    <!-- Topbar End -->

<div class="container-fluid sticky-top bg-white shadow-sm">
        <div class="container">
            <nav class="navbar navbar-expand-lg bg-white navbar-light py-3 py-lg-0">
                <a href="#" class="navbar-brand">
                    <h1 class="m-0 text-uppercase text-primary"><i class="fa fa-clinic-medical me-2"></i>CARE&CURE</h1>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarCollapse">
                    <div class="navbar-nav ms-auto py-0">
                        
                        <%
                            if (userType1==null) {
                            %>
                        <a href="index.jsp" class="nav-item nav-link">Home</a>
                        <a href="about.jsp" class="nav-item nav-link">About</a>
                        <a href="service.jsp" class="nav-item nav-link">Service</a>
                        <a href="contact.jsp" class="nav-item nav-link">Contact</a>
                        <a href="login.jsp" class="nav-item nav-link">Login</a>
                        <a href="register.jsp" class="nav-item nav-link">Register</a>
                        <%
                                }else{

                            //PATIENT NAVBAR
                            if (userType1.equalsIgnoreCase("normal")) {
                        %>
                        <a href="patient_home.jsp" class="nav-item nav-link ">Home</a>
                        <a href="p_appointment.jsp" class="nav-item nav-link">Appointment</a>
                        <a href="p_prescription.jsp" class="nav-item nav-link">Prescription</a>
                        <a href="p_history.jsp" class="nav-item nav-link">History</a>
                        <a href="p_bill.jsp" class="nav-item nav-link">Bill</a>
                        <a href="logout" class="nav-item nav-link">Logout</a>
                        <%
                            }
                        %>
                        
                        <%
                            if (userType1.equalsIgnoreCase("doctor")) {
                        %>
                        <a href="doctor_home.jsp" class="nav-item nav-link ">Home</a>
                        <a href="d_see_appointments.jsp" class="nav-item nav-link">SEE Appointments</a>
                        <a href="p_prescription.jsp" class="nav-item nav-link">Give Prescription</a>
                        <a href="p_history.jsp" class="nav-item nav-link">History</a>
                        <a href="p_bill.jsp" class="nav-item nav-link">Bill</a>
                        <a href="logout" class="nav-item nav-link">Logout</a>
                        <%
                            }
                            if (userType1.equalsIgnoreCase("admin")) {
                            %>
                        <a href="admin_home.jsp" class="nav-item nav-link ">Home</a>
                        
                        <a href="logout" class="nav-item nav-link">Logout</a>
                        <%
                            }
                            if (userType1.equalsIgnoreCase("receptionist")) {
                            %>
                            <a href="receptionist_home.jsp" class="nav-item nav-link ">Home</a>
                        
                        <a href="logout" class="nav-item nav-link">Logout</a>
                        <%
                            }}
                        %>
                        
                        
                    </div>
                </div>
            </nav>
        </div>
    </div>