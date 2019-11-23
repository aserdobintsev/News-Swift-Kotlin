package ru.aserd.newsapp_android

import android.os.AsyncTask
import android.os.Bundle
import android.os.StrictMode
import android.util.Log


import androidx.appcompat.app.AppCompatActivity
import androidx.compose.Composable
import androidx.ui.core.Text
import androidx.ui.core.dp
import androidx.ui.core.setContent
import androidx.ui.graphics.Color
import androidx.ui.layout.Column
import androidx.ui.layout.HeightSpacer
import androidx.ui.material.MaterialTheme
import androidx.ui.material.surface.Surface
import androidx.ui.tooling.preview.Preview
import org.openapitools.client.apis.ArticlesApi
import org.openapitools.client.models.Article
import java.util.*


class MainActivity : AppCompatActivity() {

    private val articlesAPI = ArticlesApi()
    private var articles = arrayOf<Article>()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        // hack to allow main thread networking, only for
        StrictMode.setThreadPolicy(StrictMode.ThreadPolicy.Builder().permitAll().build());
        setContent {
            MaterialTheme {
                Greeting(articles)
            }
        }
    }

    override fun onStart() {
        super.onStart()

        val articleList = articlesAPI.everythingGet(q="bitcoin", from= "2019-11-01", sortBy= "publishedAt", apiKey= "b5d7fe5c9d3d4e238e5e714d86b251e0")
        val articles: Array<Article>? = articleList.articles

        articles?.let{
            this.articles = it
            print(this.articles.size)
            Log.d("TAG", this.articles.size.toString())
        }
        Log.d("ARTICLES", "Loaded")
        setContent {
            MaterialTheme {
                Greeting(this.articles)
            }
        }
    }
}

@Composable
fun Greeting(articles: Array<Article>) {
    Surface() {
        Column() {
            articles.forEach {
                Text(text = (it.title.toString()))
            }
        }
    }
}

@Preview
@Composable
fun DefaultPreview() {
    MaterialTheme {
        Greeting(arrayOf<Article>())
    }
}
