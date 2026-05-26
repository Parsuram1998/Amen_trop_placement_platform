package in.sp.main.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import jakarta.mail.internet.MimeMessage;

@Service
public class EmailService {

    @Autowired
    private JavaMailSender mailSender;

    public void sendPasswordSetupEmail(
            String toEmail,
            String link
    ) {

        try {

            MimeMessage message = mailSender.createMimeMessage();

            MimeMessageHelper helper =
                    new MimeMessageHelper(message, true);

            helper.setTo(toEmail);

            helper.setSubject(
                    "Welcome to Amentrop - Complete Your Account Setup"
            );

            String content = String.format("""

                <div style="
                    background:#f4f6f9;
                    padding:40px 20px;
                    font-family:Arial,sans-serif;
                ">

                    <div style="
                        max-width:650px;
                        margin:auto;
                        background:white;
                        border-radius:12px;
                        overflow:hidden;
                        box-shadow:0 4px 15px rgba(0,0,0,0.1);
                    ">

                        <!-- HEADER -->
                        <div style="
                            background:#2042e3;
                            color:white;
                            padding:30px;
                            text-align:center;
                        ">

                            <h1 style="
                                margin:0;
                                font-size:30px;
                            ">
                                Welcome to Amentrop 
                            </h1>

                            <p style="
                                margin-top:10px;
                                font-size:15px;
                                opacity:0.9;
                            ">
                                Smart Placement & Recruitment Platform
                            </p>

                        </div>

                        <!-- BODY -->
                        <div style="padding:35px;">

                            <p style="
                                font-size:16px;
                                color:#333;
                            ">
                                Hello,
                            </p>

                            <p style="
                                font-size:15px;
                                color:#555;
                                line-height:1.8;
                            ">

                                Your account has been successfully created on
                                <b>Amentrop Placement Portal</b>.

                                Please complete your account setup by setting your password.

                            </p>

                            <div style="
                                background:#f8f9ff;
                                border-left:4px solid #2042e3;
                                padding:18px;
                                margin-top:25px;
                                border-radius:6px;
                            ">

                                <p style="
                                    margin:0;
                                    color:#444;
                                    font-size:14px;
                                ">
                                    Through Amentrop, you can:
                                </p>

                                <ul style="
                                    margin-top:12px;
                                    color:#555;
                                    line-height:2;
                                    padding-left:18px;
                                ">

                                    <li>Apply for placement drives</li>

                                    <li>Track application status updates</li>

                                    <li>Upload and manage your resume</li>

                                    <li>Participate in campus recruitment activities</li>

                                    <li>Stay connected with placement opportunities</li>

                                </ul>

                            </div>

                            <!-- BUTTON -->
                            <div style="
                                text-align:center;
                                margin-top:35px;
                            ">

                            <a href='%s'
   style="
        background:#2042e3;
        color:white;
        padding:14px 28px;
        text-decoration:none;
        border-radius:8px;
        font-weight:bold;
        display:inline-block;
        font-size:15px;
   ">

    Set Your Password

</a>

                            </div>

                            <!-- BACKUP LINK -->
                            <p style="
                                margin-top:40px;
                                color:#777;
                                font-size:13px;
                                line-height:1.8;
                            ">

                                If the button above does not work,
                                copy and paste the below link into your browser:

                            </p>

                            <p style="
                                word-break:break-all;
                                color:#2042e3;
                                font-size:13px;
                            ">
                               
                            </p>

                            <!-- FOOTER -->
                            <hr style="
                                margin-top:35px;
                                border:none;
                                border-top:1px solid #eee;
                            ">

                            <p style="
                                text-align:center;
                                color:#999;
                                font-size:12px;
                                margin-top:20px;
                            ">

                                © Amentrop Placement Portal

                                <br><br>

                                This is an automated email.
                                Please do not reply.

                            </p>

                        </div>

                    </div>

                </div>

                
""", link);
            helper.setText(content, true);

            mailSender.send(message);

            System.out.println(
                    "Email sent successfully to: " + toEmail
            );

        } catch (Exception e) {

            System.out.println(
                    "Email sending failed: " + e.getMessage()
            );

            e.printStackTrace();

        }

    }
}