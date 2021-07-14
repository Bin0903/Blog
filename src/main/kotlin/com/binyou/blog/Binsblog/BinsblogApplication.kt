package com.binyou.blog.Binsblog

import com.binyou.blog.Binsblog.dao.ArticleRepository
import com.binyou.blog.Binsblog.entity.Article
import org.springframework.boot.CommandLineRunner
import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import java.util.*

@SpringBootApplication
class BinsblogApplication {
	@Bean
	fun init(repository: ArticleRepository) = CommandLineRunner { }
}

fun main(args: Array<String>) {
	runApplication<BinsblogApplication>(*args)
}
