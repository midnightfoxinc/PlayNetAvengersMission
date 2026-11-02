.class Lcom/disneymobile/analytics/DMOAnalyticsService$1;
.super Ljava/util/TimerTask;
.source "DMOAnalyticsService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/disneymobile/analytics/DMOAnalyticsService;->scheduler()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/disneymobile/analytics/DMOAnalyticsService;


# direct methods
.method constructor <init>(Lcom/disneymobile/analytics/DMOAnalyticsService;)V
    .locals 0

    .prologue
    .line 67
    iput-object p1, p0, Lcom/disneymobile/analytics/DMOAnalyticsService$1;->this$0:Lcom/disneymobile/analytics/DMOAnalyticsService;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 71
    :try_start_0
    iget-object v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsService$1;->this$0:Lcom/disneymobile/analytics/DMOAnalyticsService;

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalyticsService;->activityUpdate()Ljava/util/TimerTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    :goto_0
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "DMOAnalytics"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Failed to update activity: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method
