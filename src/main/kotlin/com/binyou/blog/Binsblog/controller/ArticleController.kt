package com.binyou.blog.Binsblog.controller

import com.binyou.blog.Binsblog.dao.ArticleRepository
import com.binyou.blog.Binsblog.entity.Article
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.servlet.ModelAndView
import java.util.*

@Controller
class ArticleController {
    @Autowired val articleRepository: ArticleRepository? = null

    @GetMapping("listAllArticle")
    @ResponseBody
    fun listAllArticle(): MutableList<Article>? {
        return articleRepository?.findAll()
    }

    @GetMapping("listAllArticleView")
    fun listAllArticleView(model: Model): ModelAndView {
        model.addAttribute("articles", articleRepository?.findAll())
        return ModelAndView("list")
    }

    @GetMapping("addArticleView")
    fun addArticleView(model: Model): ModelAndView {
        return ModelAndView("addArticleView")
    }

    @GetMapping("detailArticleView")
    fun getArticleDetailView(id: Long, model: Model): ModelAndView {
        model.addAttribute("article", articleRepository?.findById(id)?.get())
        return ModelAndView("detailArticleView")
    }

    @GetMapping("editArticleView")
    fun editArticleView(id: Long, model: Model): ModelAndView {
        model.addAttribute("article", articleRepository?.findById(id)?.get())
        return ModelAndView("editArticleView")
    }

    @PostMapping("saveArticle")
    @ResponseBody
    fun saveArticle(article: Article): Article? {
        article.author = "Bin"
        article.gmtModified = Date()
        article.gmtCreated = Date()
        article.version = 0
        return articleRepository?.save(article)
    }

    @PostMapping("saveEditedArticle")
    @ResponseBody
    fun saveEditedArticle(article: Article): Article? {
        article.gmtModified = Date()
//        https://blog.csdn.net/zdwzzu2006/article/details/71703305
//        version不能改
//        article.version = 1
        return articleRepository?.save(article)
    }

//    @Configuration
//    class WebMvcConfig: WebMvcConfigurationSupport() {
//
//        override fun addViewControllers(registry: ViewControllerRegistry) {
//            registry?.addViewController("addArticleView")?.setViewName("addArticleView")
//        }
//    }
}