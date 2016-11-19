package vnah.util;

/**
 * Created by dell on 17.11.16.
 */
public class Util {
    public static int getValidCurrentPageNumber(int totalPageCount, int requestedPageNumber) {
        int validPageNumber = 0;
        if (totalPageCount > 0) {
            if (requestedPageNumber > totalPageCount || requestedPageNumber < 1)
                validPageNumber = 1;
            else if (requestedPageNumber <= totalPageCount)
                validPageNumber = requestedPageNumber;
        }
        return validPageNumber;
    }
}
