package com.evyatra.service;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.ObjectProvider;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class EmailService {

    private static final Logger log = LoggerFactory.getLogger(EmailService.class);

    private final ObjectProvider<JavaMailSender> mailSenderProvider;

    public void sendOtpEmail(String toEmail, String otp) {
        JavaMailSender mailSender = mailSenderProvider.getIfAvailable();
        if (mailSender == null) {
            log.warn("JavaMailSender bean is not available. Skipping OTP email for {}.", toEmail);
            return;
        }

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(toEmail);
        message.setSubject("⚡ EVyatra — Password Reset OTP");
        message.setText(
                "Hello! \n\n" +
                        "Your EVYatra Password Reset OTP is:\n\n" +
                        "🔐 OTP: " + otp + "\n\n" +
                        "This OTP is valid for 10 minutes.\n" +
                        "Do not share with anyone !\n\n" +
                        "— EVyatra Team ⚡"
        );
        mailSender.send(message);
    }
}