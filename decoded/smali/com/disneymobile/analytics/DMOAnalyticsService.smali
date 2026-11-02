.class public Lcom/disneymobile/analytics/DMOAnalyticsService;
.super Landroid/app/Service;
.source "DMOAnalyticsService.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "DMOAnalytics"


# instance fields
.field private isDisplayOn:Z

.field private isForeground:Z

.field pm:Landroid/os/PowerManager;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 148
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->pm:Landroid/os/PowerManager;

    return-void
.end method

.method private backgroundEvent()V
    .locals 2

    .prologue
    .line 174
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v0

    .line 175
    .local v0, "analyticsInstance":Lcom/disneymobile/analytics/DMOAnalytics;
    if-nez v0, :cond_0

    .line 179
    :goto_0
    return-void

    .line 178
    :cond_0
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppBackground()V

    goto :goto_0
.end method

.method private endEvent()V
    .locals 2

    .prologue
    .line 182
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v0

    .line 183
    .local v0, "analyticsInstance":Lcom/disneymobile/analytics/DMOAnalytics;
    if-nez v0, :cond_0

    .line 187
    :goto_0
    return-void

    .line 186
    :cond_0
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppEnd()V

    goto :goto_0
.end method

.method private foregroundEvent()V
    .locals 2

    .prologue
    .line 166
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v0

    .line 167
    .local v0, "analyticsInstance":Lcom/disneymobile/analytics/DMOAnalytics;
    if-nez v0, :cond_0

    .line 171
    :goto_0
    return-void

    .line 170
    :cond_0
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppForeground()V

    goto :goto_0
.end method

.method private getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;
    .locals 3

    .prologue
    .line 38
    :try_start_0
    invoke-static {}, Lcom/disneymobile/analytics/DMOAnalytics;->sharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 41
    :goto_0
    return-object v1

    .line 39
    :catch_0
    move-exception v0

    .line 40
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "DMOAnalytics"

    const-string v2, "DMOAnalyticsService Could not connect to DMOAnalytics instance."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    const/4 v1, 0x0

    goto :goto_0
.end method

.method private isActivePackage()Z
    .locals 9

    .prologue
    .line 135
    const/4 v0, 0x0

    .line 136
    .local v0, "activeB":Z
    const-string v7, "activity"

    invoke-virtual {p0, v7}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    .line 137
    .local v1, "am":Landroid/app/ActivityManager;
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v5

    .line 138
    .local v5, "list2":Ljava/util/List;, "Ljava/util/List<Landroid/app/ActivityManager$RunningAppProcessInfo;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 139
    .local v6, "ti":Landroid/app/ActivityManager$RunningAppProcessInfo;
    iget v7, v6, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v8, 0x64

    if-ne v7, v8, :cond_1

    const/4 v3, 0x1

    .line 140
    .local v3, "isPrimaryTask":Z
    :goto_1
    invoke-virtual {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v6, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    .line 143
    .local v4, "isSamePackage":Z
    if-eqz v4, :cond_0

    if-eqz v3, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    .line 139
    .end local v3    # "isPrimaryTask":Z
    .end local v4    # "isSamePackage":Z
    :cond_1
    const/4 v3, 0x0

    goto :goto_1

    .line 145
    .end local v6    # "ti":Landroid/app/ActivityManager$RunningAppProcessInfo;
    :cond_2
    return v0
.end method

.method private isScreenDisplaying()Z
    .locals 1

    .prologue
    .line 150
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->pm:Landroid/os/PowerManager;

    if-nez v0, :cond_0

    .line 151
    const-string v0, "power"

    invoke-virtual {p0, v0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/PowerManager;

    iput-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->pm:Landroid/os/PowerManager;

    .line 153
    :cond_0
    iget-object v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->pm:Landroid/os/PowerManager;

    invoke-virtual {v0}, Landroid/os/PowerManager;->isScreenOn()Z

    move-result v0

    return v0
.end method

.method private scheduler()V
    .locals 6

    .prologue
    .line 66
    new-instance v0, Ljava/util/Timer;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/Timer;-><init>(Z)V

    .line 67
    .local v0, "foregroundCheck":Ljava/util/Timer;
    new-instance v1, Lcom/disneymobile/analytics/DMOAnalyticsService$1;

    invoke-direct {v1, p0}, Lcom/disneymobile/analytics/DMOAnalyticsService$1;-><init>(Lcom/disneymobile/analytics/DMOAnalyticsService;)V

    const-wide/16 v2, 0x0

    const-wide/16 v4, 0x7530

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 78
    return-void
.end method

.method private startEvent()V
    .locals 2

    .prologue
    .line 158
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v0

    .line 159
    .local v0, "analyticsInstance":Lcom/disneymobile/analytics/DMOAnalytics;
    if-nez v0, :cond_0

    .line 163
    :goto_0
    return-void

    .line 162
    :cond_0
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->getSharedAnalyticsManager()Lcom/disneymobile/analytics/DMOAnalytics;

    move-result-object v1

    invoke-virtual {v1}, Lcom/disneymobile/analytics/DMOAnalytics;->logAppStart()V

    goto :goto_0
.end method


# virtual methods
.method public activityUpdate()Ljava/util/TimerTask;
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v3, 0x1

    .line 111
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->isActivePackage()Z

    move-result v1

    .line 112
    .local v1, "state":Z
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->isScreenDisplaying()Z

    move-result v0

    .line 114
    .local v0, "isOn":Z
    iget-boolean v2, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->isForeground:Z

    if-ne v1, v2, :cond_0

    iget-boolean v2, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->isDisplayOn:Z

    if-ne v0, v2, :cond_0

    .line 123
    :goto_0
    return-object v4

    .line 115
    :cond_0
    if-ne v1, v3, :cond_2

    if-ne v0, v3, :cond_2

    .line 116
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->foregroundEvent()V

    .line 121
    :cond_1
    :goto_1
    iput-boolean v1, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->isForeground:Z

    .line 122
    iput-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->isDisplayOn:Z

    goto :goto_0

    .line 117
    :cond_2
    if-eqz v1, :cond_3

    if-nez v0, :cond_1

    .line 118
    :cond_3
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->backgroundEvent()V

    goto :goto_1
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 48
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 53
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 54
    iput-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->isForeground:Z

    .line 55
    iput-boolean v0, p0, Lcom/disneymobile/analytics/DMOAnalyticsService;->isDisplayOn:Z

    .line 56
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->scheduler()V

    .line 57
    return-void
.end method

.method public onDestroy()V
    .locals 0

    .prologue
    .line 88
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    .line 89
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->endEvent()V

    .line 90
    return-void
.end method

.method public onStart(Landroid/content/Intent;I)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "startid"    # I

    .prologue
    .line 100
    invoke-direct {p0}, Lcom/disneymobile/analytics/DMOAnalyticsService;->startEvent()V

    .line 101
    return-void
.end method
