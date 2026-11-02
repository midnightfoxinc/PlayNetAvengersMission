.class Lcom/disneymobile/analytics/DMOAnalytics$1$1;
.super Landroid/os/Handler;
.source "DMOAnalytics.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/analytics/DMOAnalytics$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/disneymobile/analytics/DMOAnalytics$1;


# direct methods
.method constructor <init>(Lcom/disneymobile/analytics/DMOAnalytics$1;)V
    .locals 0

    .prologue
    .line 108
    iput-object p1, p0, Lcom/disneymobile/analytics/DMOAnalytics$1$1;->this$1:Lcom/disneymobile/analytics/DMOAnalytics$1;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 111
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v1

    .line 112
    .local v1, "b":Landroid/os/Bundle;
    sget-object v4, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->GIDA:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 113
    .local v2, "gida":Ljava/lang/String;
    sget-object v4, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->ISLAT:Ljava/lang/String;

    invoke-virtual {v1, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 116
    .local v3, "isLatStatus":I
    sget v4, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->isLatException:I

    if-eq v3, v4, :cond_0

    .line 117
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->access$000()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v2}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setGida(Landroid/content/Context;Ljava/lang/String;)V

    .line 125
    :goto_0
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->access$000()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v3}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setIsLat(Landroid/content/Context;I)V

    .line 126
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v4

    invoke-virtual {v4}, Landroid/os/Looper;->quit()V

    .line 127
    return-void

    .line 121
    :cond_0
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->access$000()Landroid/content/Context;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v4

    const-string v5, "android_id"

    invoke-static {v4, v5}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "an_id":Ljava/lang/String;
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->access$000()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4, v0}, Lcom/disneymobile/analytics/DMOAnalyticsSysInfo;->setAnID(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0
.end method
