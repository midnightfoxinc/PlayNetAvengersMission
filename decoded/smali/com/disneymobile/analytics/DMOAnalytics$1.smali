.class Lcom/disneymobile/analytics/DMOAnalytics$1;
.super Ljava/lang/Object;
.source "DMOAnalytics.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/disneymobile/analytics/DMOAnalytics;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/analytics/DMOAnalytics;


# direct methods
.method constructor <init>(Lcom/disneymobile/analytics/DMOAnalytics;)V
    .locals 0

    .prologue
    .line 100
    iput-object p1, p0, Lcom/disneymobile/analytics/DMOAnalytics$1;->this$0:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 103
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 108
    new-instance v2, Lcom/disneymobile/analytics/DMOAnalytics$1$1;

    invoke-direct {v2, p0}, Lcom/disneymobile/analytics/DMOAnalytics$1$1;-><init>(Lcom/disneymobile/analytics/DMOAnalytics$1;)V

    .line 131
    .local v2, "handler":Landroid/os/Handler;
    new-instance v5, Landroid/os/Message;

    invoke-direct {v5}, Landroid/os/Message;-><init>()V

    .line 132
    .local v5, "msg":Landroid/os/Message;
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 134
    .local v1, "b":Landroid/os/Bundle;
    iget-object v6, p0, Lcom/disneymobile/analytics/DMOAnalytics$1;->this$0:Lcom/disneymobile/analytics/DMOAnalytics;

    invoke-virtual {v6}, Lcom/disneymobile/analytics/DMOAnalytics;->getAdInfo()Ljava/util/HashMap;

    move-result-object v0

    .line 136
    .local v0, "adInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_1

    .line 137
    sget-object v6, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v4

    .line 138
    .local v4, "isLAT":I
    sget-object v6, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    invoke-virtual {v1, v6, v4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 140
    sget-object v6, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 141
    sget-object v6, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 142
    .local v3, "id":Ljava/lang/String;
    sget-object v6, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-virtual {v1, v6, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .end local v3    # "id":Ljava/lang/String;
    .end local v4    # "isLAT":I
    :cond_0
    :goto_0
    invoke-virtual {v5, v1}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 150
    invoke-virtual {v2, v5}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 151
    invoke-static {}, Landroid/os/Looper;->loop()V

    .line 152
    return-void

    .line 145
    :cond_1
    const-string v6, "DMOAnalytics"

    const-string v7, "AdvertisingIdClient not available"

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 146
    sget-object v6, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    sget v7, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    goto :goto_0
.end method
