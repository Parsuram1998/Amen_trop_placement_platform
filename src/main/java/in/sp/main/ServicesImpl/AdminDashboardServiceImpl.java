package in.sp.main.ServicesImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import in.sp.main.Enums.FresherStatus;
import in.sp.main.Repositories.FresherProfileRepository;
import in.sp.main.Services.AdminDashboardService;

@Service
public class AdminDashboardServiceImpl implements AdminDashboardService {

    @Autowired
    private FresherProfileRepository fresherRepo;

    public long totalFreshers(){
        return fresherRepo.count();
    }

    public long selectedFreshers(){
        return fresherRepo.countByStatus(FresherStatus.SELECTED);
    }

    public long needsImprovement(){
        return fresherRepo.countByStatus(FresherStatus.NEEDS_IMPROVEMENT);
    }

}