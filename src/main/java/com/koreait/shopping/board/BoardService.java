package com.koreait.shopping.board;

import com.koreait.shopping.Paging.BoardCriteria;
import com.koreait.shopping.Paging.Criteria;
import com.koreait.shopping.UserUtils;
import com.koreait.shopping.board.model.dto.BoardListDto;
import com.koreait.shopping.board.model.entity.BoardListEntity;
import com.koreait.shopping.board.model.entity.BoardPrevNextVo;
import com.koreait.shopping.board.model.entity.BoardProductEntity;
import com.koreait.shopping.board.model.vo.BoardListVo;
import com.koreait.shopping.board.model.vo.BoardProductVo;
import com.koreait.shopping.user.model.entity.UserEntity;
import com.koreait.shopping.user.model.dto.UserReviewDto;
import com.koreait.shopping.user.model.entity.UserReviewEntity;
import com.koreait.shopping.user.model.vo.UserReviewVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
public class BoardService {
    @Autowired
    private BoardMapper mapper;
    @Autowired
    private UserUtils userUtils;

    public int insBoard(BoardListEntity entity) {
        try {
            entity.setIuser(userUtils.getLoginUserPk());
            return mapper.insBoard(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public List<BoardListVo> selBoardList(BoardCriteria cri) {
        return mapper.selBoardList(cri);
    }

    //BoardListVo -> BoardListDto 로 바꿔줌 (디테일 창에서 이전 다음글 정상화)
    public BoardListVo selBoard(BoardListDto dto) {
        System.out.println(dto.getIboard());
        System.out.println(userUtils.getLoginUserPk());

        return mapper.selBoardDetail(dto);
    }

    /* Board 게시물 총 갯수 */
    public int getBoardTotal(BoardCriteria cri) {
        return mapper.getBoardTotal(cri);
    }

    public int getSearchTotal(BoardCriteria cri) {
        return mapper.getSearchTotal(cri);
    }

    /* Product 게시물 총 갯수 */
    public int getTotal(int isubctegory) {
        return mapper.getTotal(isubctegory);
    }


    public int updBoard(BoardListEntity entity) {
        try {
            entity.setIuser(userUtils.getLoginUserPk());
            return mapper.updBoard(entity);
        } catch (Exception e) {
            e.printStackTrace();
            return 0;
        }
    }

    public BoardPrevNextVo selPrevNext(BoardListVo vo) {
        return mapper.selPrevNext(vo);
    }

    public int delBoard(BoardListEntity entity) {
        entity.setIuser(userUtils.getLoginUserPk());
        return mapper.delBoard(entity);
    }

    public List<BoardProductVo> selProductList(Criteria cri) {
        return mapper.selProductList(cri);
    }

    public BoardProductEntity selProductDetail(BoardProductVo vo) {
        return mapper.selProductDetail(vo);
    }

    public List<BoardProductVo> selDetailList(BoardProductVo vo) {
        return mapper.selDetailList(vo);
    }

    public BoardProductVo selIdetail(BoardProductVo vo) {
        return mapper.selIdetail(vo);
    }

    public List<UserReviewVo> selBoardReview(UserReviewVo vo) {
        return mapper.selBoardReview(vo);
    }

    public int insCart(BoardProductVo vo) {return mapper.insCart(vo);}
    public int insCartChecked(BoardProductVo vo) {return mapper.insCartChecked(vo);}

    public List<BoardProductVo> selCart(UserEntity entity) {return mapper.selCart(entity);}
    public int delCart(int icart) {
        BoardProductVo vo = new BoardProductVo();
        vo.setIcart(icart);
        return mapper.delCart(vo);
    }
    public int delCartChecked(int iuser) {
        return mapper.delCartChecked(iuser);
    }
    public int selectedCart(int icart) {
        BoardProductVo vo = new BoardProductVo();
        vo.setIcart(icart);
        return mapper.selectedCart(vo);
    }

    public List<UserReviewDto> selReview() {
        return mapper.selReview();
    }

    public int unselectedCart(int icart) {
        BoardProductVo vo = new BoardProductVo();
        vo.setIcart(icart);
        return mapper.unselectedCart(vo);
    }

    public int updCartUp(BoardProductVo vo) {
        return mapper.updCartUp(vo);
    }

    public int updCartDown(BoardProductVo vo) {
        return mapper.updCartDown(vo);
    }

    public BoardProductVo selSize(BoardProductVo vo) {
        return mapper.selSize(vo);
    }

    public List<BoardProductVo> searchProductList (Criteria cri) {
        return mapper.searchProductList(cri);
    }

    public int getPrSearchTotal(Criteria cri) {
        return mapper.getPrSearchTotal(cri);
    }

    public List<BoardListVo> searchBoardList(BoardCriteria cri) {
        return mapper.searchBoardList(cri);
    }


    public int insPurchased(BoardProductVo vo) {
        return mapper.insPurchased(vo);
    }




    private static final String CK_IMAGE_PATH = File.separator + "uploadImage";

    public Map<String, String> ckEditorUploadImage(MultipartFile file, HttpServletRequest request) {
        if(file==null || "".equals(file.getOriginalFilename().trim())) {
            return generateResult(false, "#");
        }
        String originalName = file.getOriginalFilename();
        // generate file name
        String localFileName = System.currentTimeMillis() + "-" + originalName;
        // get project path
        String projectRealPath = request.getSession().getServletContext().getRealPath("");
        // get the real path to store received images
        String realPath = projectRealPath + CK_IMAGE_PATH;
        File imageDir = new File(realPath);
        if(!imageDir.exists()) {
            imageDir.mkdirs();
        }

        String localFilePath = realPath + File.separator + localFileName;
        try {
            file.transferTo(new File(localFilePath));
        } catch (IllegalStateException e) {
            e.printStackTrace();
            // log here
        } catch (IOException e) {
            e.printStackTrace();
            // log here
        }
        String imageContextPath = request.getContextPath() + "/uploadImage" + "/" + localFileName;
        // log here +
        System.out.println("received file original name: " + originalName);
        System.out.println("stored local file name: " + localFileName);
        System.out.println("file stored path: " + localFilePath);
        System.out.println("returned url: " + imageContextPath);
        // log here -
        return generateResult(true, imageContextPath);
    }

    private Map<String, String> generateResult(boolean uploaded, String relativeUrl){
        Map<String, String> result = new HashMap<String, String>();
        result.put("uploaded", uploaded + "");
        result.put("url", relativeUrl);

        return result;
    }


}