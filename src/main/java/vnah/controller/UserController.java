package vnah.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import vnah.model.User;
import vnah.service.UserService;

import static vnah.util.Util.getValidCurrentPageNumber;

/**
 * Created by dell on 11.11.16.
 */
@Controller
public class UserController {

    private UserService userService;

    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = {"/users", "/"}, method = RequestMethod.GET)
    public String welcomePage() {
        return "redirect:/users/1";
    }

    @RequestMapping(value = {"/users/{requestedPageNumber}"}, method = RequestMethod.GET)
    public String getAllUsers(@PathVariable(value = "requestedPageNumber") int requestedPageNumber,
                              Model model) {
        int usersCount = this.userService.getUsersCount();
        int totalPageCount = this.userService.getPageCount(usersCount);
        int currPageNumber = getValidCurrentPageNumber(totalPageCount, requestedPageNumber);
        int prevPageNumber = currPageNumber > 1 ? currPageNumber - 1 : 0;
        int nextPageNumber = currPageNumber < totalPageCount && currPageNumber != 0 ? currPageNumber + 1 : 0;
        model.addAttribute("urlPart", "users");
        model.addAttribute("prevPageNumber", prevPageNumber);
        model.addAttribute("currentPageNumber", currPageNumber);
        model.addAttribute("nextPageNumber", nextPageNumber);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("users", this.userService.getUsersPage(currPageNumber, totalPageCount));
        return "user";
    }

    @RequestMapping(value = "/search")
    public String search(@RequestParam("userNameForSearch") String userNameForSearch,
                         @RequestParam("requestedPageNumber") int requestedPageNumber) {
        if (userNameForSearch == null || userNameForSearch.equals("")) userNameForSearch = " ";
        return "redirect:/search/" + userNameForSearch + "/" + requestedPageNumber;
    }

    @RequestMapping(value = {"/search/{userNameForSearch}/{requestedPageNumber}"})
    public String getUsersByName(@PathVariable("userNameForSearch") String userNameForSearch,
                                 @PathVariable("requestedPageNumber") int requestedPageNumber,
                                 Model model) {
        int usersCountWithName = this.userService.getUsersCountWithName(userNameForSearch);
        int totalPageCount = this.userService.getPageCountForName(usersCountWithName);
        int currPageNumber = getValidCurrentPageNumber(totalPageCount, requestedPageNumber);
        int prevPageNumber = currPageNumber > 1 ? currPageNumber - 1 : 0;
        int nextPageNumber = currPageNumber < totalPageCount && currPageNumber != 0 ? currPageNumber + 1 : 0;
        model.addAttribute("userNameForSearch", userNameForSearch);
        model.addAttribute("urlPart", "search/" + userNameForSearch);
        model.addAttribute("prevPageNumber", prevPageNumber);
        model.addAttribute("currentPageNumber", currPageNumber);
        model.addAttribute("nextPageNumber", nextPageNumber);
        model.addAttribute("totalPageCount", totalPageCount);
        model.addAttribute("users", this.userService.getUsersPageWithName(currPageNumber, totalPageCount, userNameForSearch));
        return "user";
    }

    //delete user and refresh
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") int id) {
        this.userService.deleteUser(id);
        return "redirect:/users";
    }

    //to add user page
    @RequestMapping(value = "/addNewUser", method = RequestMethod.GET)
    public String addNewUser(Model model) {
        model.addAttribute("user", new User());
        return "userCreateUpdate";
    }

    //to edit user page
    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public String updateUser(@PathVariable("id") int id, Model model) {
        model.addAttribute("user", this.userService.getUserById(id));
        return "userCreateUpdate";
    }

    //create update user
    @RequestMapping(value = "/user/createUpdate", method = RequestMethod.POST)
    public String createUser(@ModelAttribute("user") User user) {
        if (user.getId() == 0) this.userService.createUser(user);
        else this.userService.updateUser(user);
        return "redirect:/users";
    }

}