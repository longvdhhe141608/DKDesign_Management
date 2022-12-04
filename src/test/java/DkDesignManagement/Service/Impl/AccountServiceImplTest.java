package DkDesignManagement.Service.Impl;

import DkDesignManagement.Entity.Account;
import DkDesignManagement.Repository.AccountDao;
import DkDesignManagement.Service.AccountService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.*;
import static org.mockito.Mockito.when;

import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

@ExtendWith(MockitoExtension.class)
class AccountServiceImplTest {

    //viết unit test nào thì sẽ inject mock ở đó
    @InjectMocks
    private AccountServiceImpl accountService;

    //không trọc vào DB mà chỉ giả lập
    @Mock
    private AccountDao accountDao;

    //format đặt tên
    //cho giá trị ban đầu như nào + then + tên funtion test + kết quả của funtion
    @Test
    void GivenUsernameExactValue_getAccount_ResultAccountExact() {
        //input
        String username = "abc-demo";

        //giả lập là funtion getAcount trả về 1 giá trị gì đó ở tần dao
        //mock accountDao.getAccount(username)
        Account accountMock = new Account();
        accountMock.setId(1);
        accountMock.setUsername("abc-demo");
        when(accountDao.getAccount(anyString())).thenReturn(accountMock);

        //gọi đến funtion cần test
        Account result = accountService.getAccount(username);


        assertEquals(result.getId(), 1);
        assertEquals(result.getUsername(), "abc-demo");

    }

    @Test
    void GivenUsernameExactValue_isExisted_ReturnBooleanValue() {
        //input
        String username = "abc-demo";

        //mock các funtion DAO ở trong funtion viết unit test
        //giả lập là funtion getAcount trả về 1 giá trị gì đó ở tầng dao
        //mock accountDao.getAllAccount()
        List<Account> accountList = new ArrayList<>();
        Account accountMock = new Account();
        accountMock.setId(1);
        accountMock.setUsername("abc-demo");
        accountList.add(accountMock);
        when(accountDao.getAllAccount()).thenReturn(accountList);

        //gọi đến funtion cần test
        boolean result = accountService.isExisted(username);

        assertEquals(result, true);

    }

    @Test
    void GivenUsernameExactValue_isExisted_ReturnBooleanFalseValue() {
        //input
        String username = "abc-demo";

        //mock các funtion DAO ở trong funtion viết unit test
        //giả lập là funtion getAcount trả về 1 giá trị gì đó ở tầng dao
        //mock accountDao.getAllAccount()
        List<Account> accountList = new ArrayList<>();
        Account accountMock = new Account();
        accountMock.setUsername("123");
        accountList.add(accountMock);
        when(accountDao.getAllAccount()).thenReturn(accountList);

        //gọi đến funtion cần test
        boolean result = accountService.isExisted(username);

        assertEquals(result, false);

    }

    @Test
    void GivenListValue_listAccount_ReturnListValue() {
        List<Account> accountList = new ArrayList<>();
        when(accountDao.getAllAccount()).thenReturn(accountList);

        accountList = accountDao.getAllAccount();
        int result = accountService.getAllAccount().size();
        assertEquals(result, accountList.size());
    }

    
}