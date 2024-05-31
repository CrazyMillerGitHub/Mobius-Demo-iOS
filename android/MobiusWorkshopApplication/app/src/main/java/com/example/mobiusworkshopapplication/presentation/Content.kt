package com.example.mobiusworkshopapplication.presentation

import androidx.compose.foundation.background
import androidx.compose.foundation.clickable
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Box
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.Row
import androidx.compose.foundation.layout.Spacer
import androidx.compose.foundation.layout.WindowInsets
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.height
import androidx.compose.foundation.layout.heightIn
import androidx.compose.foundation.layout.padding
import androidx.compose.foundation.layout.width
import androidx.compose.foundation.layout.wrapContentHeight
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.shape.RoundedCornerShape
import androidx.compose.material3.CenterAlignedTopAppBar
import androidx.compose.material3.ExperimentalMaterial3Api
import androidx.compose.material3.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.getValue
import androidx.compose.runtime.mutableIntStateOf
import androidx.compose.runtime.remember
import androidx.compose.runtime.setValue
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.draw.clip
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.text.TextStyle
import androidx.compose.ui.text.font.FontWeight
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import com.example.mobiusworkshopapplication.presentation.model.ContentState
import com.example.mobiusworkshopapplication.presentation.model.StateEvent
import com.valentinilk.shimmer.shimmer

private val title
    get()= "Мои заказы"

@Composable
@ExperimentalMaterial3Api
internal fun Content(
    state: ContentState,
    onEvent: (StateEvent) -> Unit,
) {
    Column(
        modifier = Modifier
            .background(secondaryAppColor)
    ) {
        TopBar(
            modifier = Modifier,
            title = title
        )
        ChipsSection(onEvent)
        Spacer(
            modifier = Modifier.height(4.dp)
        )
        LazyColumn {
            item {
                when (state) {
                    is ContentState.Content -> SplitSection()
                    ContentState.Loading -> LoadingSplitSection()
                }
            }

            items(
                count = 10,
                itemContent = {
                    Spacer(
                        modifier = Modifier.height(4.dp)
                    )
                    when (state) {
                        is ContentState.Content -> OrderSection()
                        ContentState.Loading -> LoadingSection()
                    }
                    Spacer(
                        modifier = Modifier.height(4.dp)
                    )
                }
            )
        }
    }
}

@Composable
@ExperimentalMaterial3Api
private fun TopBar(
    modifier: Modifier,
    title: String
) {
    CenterAlignedTopAppBar(
        title = {
            Text(
                text = title,
                style = TextStyle(
                    color = Color.Black,
                    fontSize = 24.sp,
                    fontWeight = FontWeight.Bold
                ),
            )
        },
        windowInsets = WindowInsets(
            top = 0.dp,
            bottom = 0.dp,
        ),
        modifier = modifier,
    )
}

@Composable
@ExperimentalMaterial3Api
private fun ChipsSection(
    onEvent: (StateEvent) -> Unit,
) {
    var selected by remember { mutableIntStateOf(0) }

    Row(
        modifier = Modifier
            .fillMaxWidth()
            .wrapContentHeight()
            .background(Color.White)
            .padding(vertical = 8.dp),
        horizontalArrangement = Arrangement.Center
    ) {
        Box(
            modifier = Modifier
                .clip(RoundedCornerShape(15.dp))
                .background(
                    if (selected == 0) chipSelectedColor else chipColor
                )
                .clickable {
                    selected = 0
                    onEvent.invoke(StateEvent.MarketSelected)
                }
        ) {
            Text(
                text = "Маркет",
                modifier = Modifier
                    .padding(8.dp),
                style = TextStyle(
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                    color = if (selected == 1) Color.Black else Color.White,
                )
            )
        }
        Spacer(modifier = Modifier.width(4.dp))
        Box(
            modifier = Modifier
                .clip(RoundedCornerShape(15.dp))
                .background(
                    if (selected == 1) chipSelectedColor else chipColor
                )
                .clickable {
                    onEvent.invoke(StateEvent.RestaurantsSelected)
                    selected = 1
                }
        ) {
            Text(
                text = "Магазины и рестораны",
                modifier = Modifier
                    .padding(8.dp),
                style = TextStyle(
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Bold,
                    color = if (selected == 0) Color.Black else Color.White
                )
            )
        }
    }
}

@Composable
private fun SplitSection() {
    Box(modifier = Modifier
        .fillMaxWidth()
        .background(secondaryAppColor)
        .heightIn(min = 77.dp)
    ) {
        Text(
            modifier = Modifier
                .align(Alignment.Center),
            text = "Split"
        )
    }
}

@Composable
private fun LoadingSection() {
    Box(modifier = Modifier
        .fillMaxWidth()
        .shimmer()
        .background(Color.Gray.copy(alpha = 0.2f))
        .heightIn(min = 200.dp)
    )
}
@Composable
private fun OrderSection() {
    Box(modifier = Modifier
        .fillMaxWidth()
        .background(Color.White)
        .heightIn(min = 200.dp)
    ) {
        Text(
            modifier = Modifier
                .align(Alignment.Center),
            text = "Order"
        )
    }
}

@Composable
private fun LoadingSplitSection() {
    Box(modifier = Modifier
        .fillMaxWidth()
        .shimmer()
        .background(Color.Gray.copy(alpha = 0.2f))
        .heightIn(min = 77.dp)
    )
}

private val chipSelectedColor
    get()= Color(0xFF42413E)

private val secondaryAppColor
    get()=Color(0xFFF5F4F2)

private val chipColor
    get()=Color(0xFFE1E3E8)
