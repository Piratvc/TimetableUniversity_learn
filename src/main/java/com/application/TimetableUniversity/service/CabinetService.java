package com.application.TimetableUniversity.service;
import com.application.TimetableUniversity.model.Cabinet;
import com.application.TimetableUniversity.repository.CabinetRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class CabinetService {
    private final CabinetRepository cabinetRepository;

    @Autowired
    public CabinetService(CabinetRepository cabinetRepository) {
        this.cabinetRepository = cabinetRepository;
    }

    public Cabinet findById(Long id) {
        return cabinetRepository.getReferenceById(id);
    }

    public void saveCabinet(Cabinet cabinet) {
        cabinetRepository.save(cabinet);
    }

    public List<Cabinet> findAll() {
        return cabinetRepository.findAll();
    }

    public void deleteById(Long id) {
        cabinetRepository.deleteById(id);
    }
}
