package in.sp.main.Services;

import in.sp.main.Entities.Job;

public interface JobMailService {

    void sendJobNotification(Job job);
}