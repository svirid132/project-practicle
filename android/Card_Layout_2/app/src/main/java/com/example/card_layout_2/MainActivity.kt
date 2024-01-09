package com.example.card_layout_2

import android.graphics.drawable.Icon
import android.os.Bundle
import androidx.activity.ComponentActivity
import androidx.activity.compose.setContent
import androidx.compose.foundation.Image
import androidx.compose.foundation.background
import androidx.compose.foundation.border
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.offset
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.size
import androidx.compose.foundation.layout.wrapContentSize
import androidx.compose.foundation.shape.CircleShape
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Check
import androidx.compose.material3.Button
import androidx.compose.material3.Icon
import androidx.compose.material3.MaterialTheme
import androidx.compose.material3.Surface
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.ColorFilter
import androidx.compose.ui.graphics.graphicsLayer
import androidx.compose.ui.layout.ModifierInfo
import androidx.compose.ui.res.painterResource
import androidx.compose.ui.tooling.preview.Preview
import androidx.compose.ui.unit.TextUnit
import androidx.compose.ui.unit.sp
import com.example.card_layout_2.ui.theme.Card_Layout_2Theme
import androidx.compose.ui.text.font.FontFamily
import androidx.compose.ui.text.font.Font
import androidx.compose.ui.unit.dp

class MainActivity : ComponentActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContent {
            Card_Layout_2Theme {
                // A surface container using the 'background' color from the theme
                Surface(
                    modifier = Modifier.fillMaxSize(),
                    color = MaterialTheme.colorScheme.background
                ) {
                    ArtistCardColumn()
                }
            }
        }
    }
}

@Composable
fun CheckIcon(modifier: Modifier) {
    Box(
        modifier = modifier
            .size(20.dp)
            .clip(CircleShape)
            .background(color = Color(0x41, 0xc3, 0x0))
            .border(width = 1.dp, color = Color(0x41, 0xc3, 0x0), shape = CircleShape)
            .padding(2.dp)
    ) {
        Icon(Icons.Filled.Check, contentDescription = "Check mark", tint = Color.White)
    }
}

@Composable
fun ArtistImage() {
    Box(modifier = Modifier
        .size(50.dp)
        .clip(CircleShape)
        .graphicsLayer {
            this.scaleX = 2f
            this.scaleY = 2f
            this.translationX = 20.dp.toPx()
            this.translationY = 15.dp.toPx()
        }
    ) {
        Image(
            painter = painterResource(R.drawable.alfred_sisley_photo_full),
            contentDescription = "Artist image",
        )
    }
}

@Composable
fun ArtistCardColumn() {
    var isCheck by remember { mutableStateOf(false) }
    Surface(onClick = {
        print("text")
        isCheck = !isCheck
    }, modifier = Modifier.wrapContentSize()) {
        Row() {// verticalAlignment = Alignment.CenterVertically
            Box() {
                ArtistImage()
                if (isCheck) {
                    CheckIcon(
                        modifier = Modifier
                            .align(Alignment.BottomEnd)
                            .offset(x = 2.dp)
                    )
                }
            }
            Spacer(modifier = Modifier.size(16.dp))
            Column {
                Text("Alfred Sisley", fontSize = 16.sp)
                Text("3 minutes ago", fontSize = 12.sp, color = Color.Gray)
            }
        }
    }
}

@Preview(showBackground = true)
@Composable
fun ArtistCardColumnPreview() {
    Card_Layout_2Theme {
        ArtistCardColumn()
    }
}

@Composable
fun Greeting(name: String, modifier: Modifier = Modifier) {
    Text(`1
        text = "Hello $name!",
        modifier = modifier
    )
}
