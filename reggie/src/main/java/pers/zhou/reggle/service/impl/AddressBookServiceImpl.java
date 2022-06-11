package pers.zhou.reggle.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import pers.zhou.reggle.entity.AddressBook;
import pers.zhou.reggle.mapper.AddressBookMapper;
import pers.zhou.reggle.service.AddressBookService;

@Service
public class AddressBookServiceImpl extends ServiceImpl<AddressBookMapper,AddressBook> implements AddressBookService {
}
