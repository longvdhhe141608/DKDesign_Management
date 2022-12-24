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
        String username = "longvdh";

        //giả lập là funtion getAcount trả về 1 giá trị gì đó ở tần dao
        //mock accountDao.getAccount(username)
        Account accountMock = new Account();
        accountMock.setId(1);
        accountMock.setUsername("longvdh");
        when(accountDao.getAccount(anyString())).thenReturn(accountMock);

        //gọi đến funtion cần test
        Account result = accountService.getAccount(username);


        assertEquals(result.getId(), 1);
        assertEquals(result.getUsername(), "longvdh");

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

    @Test
    void GivenListValue_listAccountByProjectId_ReturnListValue() {
        int id = 3;
        List<Account> accountList = new ArrayList<>();
        when(accountDao.getAllAccountByProject(id)).thenReturn(accountList);
        accountList = accountDao.getAllAccountByProject(id);
        int result = accountService.getAccountsByProjectId(id).size();
        assertEquals(result, accountList.size());
    }

    @Test
    void GivenListValue_listUsername_ReturnListValue() {
        List<String> listUsername = new ArrayList<>();
        when(accountDao.getAllUsername()).thenReturn(listUsername);
        listUsername = accountDao.getAllUsername();
        int result = accountService.getUsernameList().size();
        assertEquals(result, listUsername.size());
    }

    @Test
    void GivenNewAccount_addNewAccount_ReturnNewAccount() {
        String username = "test";
        String password = "12345678";
        int role = 2;
        when(accountDao.addNewAccount(anyString(), anyString(), anyInt())).thenReturn(1);
        int check = accountService.addNewAccount(username, password, role);
        assertEquals(check, 1);
    }

    @Test
    void GivenUpdateAccount_updateAvatar_ReturnAccount() {
        int id = 1;
        String url = "day-la-link";
        when((accountDao.updateAvatar(anyInt(), anyString()))).thenReturn(1);
        int check = accountService.updateAvatar(id, url);
        assertEquals(check, 1);
    }

    @Test
    void GivenPassword_changePassword_ReturnPassword() {
        int id = 1;
        String pass = "matkhaumoi";
        when(accountDao.changePassword(anyInt(), anyString())).thenReturn(1);
        int check = accountService.changePassword(id, pass);
        assertEquals(check, 1);
    }
}