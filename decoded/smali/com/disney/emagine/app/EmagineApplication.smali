.class public Lcom/disney/emagine/app/EmagineApplication;
.super Landroid/app/Application;
.source "EmagineApplication.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;
    }
.end annotation


# static fields
.field public static final TAG:Ljava/lang/String; = "EmagineApplication"

.field private static app:Lcom/disney/emagine/app/EmagineApplication;


# instance fields
.field public final creationTime:J

.field private mAnalyticsHandler:Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

.field private mAnalyticsHandlerThread:Landroid/os/HandlerThread;

.field private mBackgroundHandler:Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

.field private mBackgroundHandlerThread:Landroid/os/HandlerThread;

.field private mComponentCallbacks:Lcom/disney/emagine/app/ComponentCallbacks;

.field private mConsole:Lcom/disney/emagine/sdk/EMTConsole;

.field private mLifecycleCallback:Lcom/disney/emagine/app/ActivityLifecycleCallback;

.field private mMainHandler:Landroid/os/Handler;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 66
    invoke-direct {p0}, Landroid/app/Application;-><init>()V

    .line 22
    invoke-static {}, Lcom/disney/emagine/sdk/EMTConsole;->sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;

    move-result-object v0

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    .line 67
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/disney/emagine/app/EmagineApplication;->creationTime:J

    .line 69
    return-void
.end method

.method public static app()Lcom/disney/emagine/app/EmagineApplication;
    .locals 1

    .prologue
    .line 72
    sget-object v0, Lcom/disney/emagine/app/EmagineApplication;->app:Lcom/disney/emagine/app/EmagineApplication;

    return-object v0
.end method

.method public static trimLevelToString(I)Ljava/lang/String;
    .locals 2
    .param p0, "level"    # I

    .prologue
    .line 174
    sparse-switch p0, :sswitch_data_0

    .line 191
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "UNKNOWN ("

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    .line 176
    :sswitch_0
    const-string v0, "TRIM_MEMORY_BACKGROUND"

    goto :goto_0

    .line 178
    :sswitch_1
    const-string v0, "TRIM_MEMORY_COMPLETE"

    goto :goto_0

    .line 180
    :sswitch_2
    const-string v0, "TRIM_MEMORY_MODERATE"

    goto :goto_0

    .line 182
    :sswitch_3
    const-string v0, "TRIM_MEMORY_RUNNING_CRITICAL"

    goto :goto_0

    .line 184
    :sswitch_4
    const-string v0, "TRIM_MEMORY_RUNNING_LOW"

    goto :goto_0

    .line 186
    :sswitch_5
    const-string v0, "TRIM_MEMORY_RUNNING_MODERATE"

    goto :goto_0

    .line 188
    :sswitch_6
    const-string v0, "TRIM_MEMORY_UI_HIDDEN"

    goto :goto_0

    .line 174
    :sswitch_data_0
    .sparse-switch
        0x5 -> :sswitch_5
        0xa -> :sswitch_4
        0xf -> :sswitch_3
        0x14 -> :sswitch_6
        0x28 -> :sswitch_0
        0x3c -> :sswitch_2
        0x50 -> :sswitch_1
    .end sparse-switch
.end method


# virtual methods
.method public analyticsHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 166
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mAnalyticsHandler:Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

    return-object v0
.end method

.method public backgroundHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mBackgroundHandler:Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

    return-object v0
.end method

.method public elapsedLife()J
    .locals 4

    .prologue
    .line 82
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/disney/emagine/app/EmagineApplication;->creationTime:J

    sub-long/2addr v0, v2

    return-wide v0
.end method

.method public mainHandler()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 170
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mMainHandler:Landroid/os/Handler;

    return-object v0
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 3
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 145
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EmagineApplication"

    const-string v2, "onConfigurationChanged"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    invoke-super {p0, p1}, Landroid/app/Application;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 147
    return-void
.end method

.method public onCreate()V
    .locals 3

    .prologue
    .line 87
    invoke-super {p0}, Landroid/app/Application;->onCreate()V

    .line 88
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-virtual {v0, p0}, Lcom/disney/emagine/sdk/EMTConsole;->setLogLevelFromContext(Landroid/content/Context;)Z

    .line 89
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EmagineApplication"

    const-string v2, "onCreate"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    sput-object p0, Lcom/disney/emagine/app/EmagineApplication;->app:Lcom/disney/emagine/app/EmagineApplication;

    .line 92
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mLifecycleCallback:Lcom/disney/emagine/app/ActivityLifecycleCallback;

    if-nez v0, :cond_0

    .line 93
    new-instance v0, Lcom/disney/emagine/app/ActivityLifecycleCallback;

    invoke-direct {v0}, Lcom/disney/emagine/app/ActivityLifecycleCallback;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mLifecycleCallback:Lcom/disney/emagine/app/ActivityLifecycleCallback;

    .line 94
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mLifecycleCallback:Lcom/disney/emagine/app/ActivityLifecycleCallback;

    invoke-virtual {p0, v0}, Lcom/disney/emagine/app/EmagineApplication;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 95
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EmagineApplication"

    const-string v2, "onCreate: registered lifecycle callback"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mComponentCallbacks:Lcom/disney/emagine/app/ComponentCallbacks;

    if-nez v0, :cond_1

    .line 99
    new-instance v0, Lcom/disney/emagine/app/ComponentCallbacks;

    invoke-direct {v0}, Lcom/disney/emagine/app/ComponentCallbacks;-><init>()V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mComponentCallbacks:Lcom/disney/emagine/app/ComponentCallbacks;

    .line 100
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mComponentCallbacks:Lcom/disney/emagine/app/ComponentCallbacks;

    invoke-virtual {p0, v0}, Lcom/disney/emagine/app/EmagineApplication;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 101
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EmagineApplication"

    const-string v2, "onCreate: registered component callback"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    :cond_1
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mBackgroundHandlerThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_2

    .line 105
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "ApplicationHandler"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mBackgroundHandlerThread:Landroid/os/HandlerThread;

    .line 106
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mBackgroundHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 107
    new-instance v0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

    iget-object v1, p0, Lcom/disney/emagine/app/EmagineApplication;->mBackgroundHandlerThread:Landroid/os/HandlerThread;

    .line 108
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;-><init>(Lcom/disney/emagine/app/EmagineApplication;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mBackgroundHandler:Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

    .line 112
    :cond_2
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mAnalyticsHandlerThread:Landroid/os/HandlerThread;

    if-nez v0, :cond_3

    .line 113
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "AnalyticsHandler"

    const/16 v2, 0x13

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mAnalyticsHandlerThread:Landroid/os/HandlerThread;

    .line 114
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mAnalyticsHandlerThread:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->start()V

    .line 115
    new-instance v0, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

    iget-object v1, p0, Lcom/disney/emagine/app/EmagineApplication;->mAnalyticsHandlerThread:Landroid/os/HandlerThread;

    .line 116
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;-><init>(Lcom/disney/emagine/app/EmagineApplication;Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mAnalyticsHandler:Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

    .line 120
    :cond_3
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mMainHandler:Landroid/os/Handler;

    if-nez v0, :cond_4

    .line 121
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Lcom/disney/emagine/app/EmagineApplication;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mMainHandler:Landroid/os/Handler;

    .line 124
    :cond_4
    return-void
.end method

.method public onLowMemory()V
    .locals 3

    .prologue
    .line 151
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EmagineApplication"

    const-string v2, "onLowMemory"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 152
    invoke-super {p0}, Landroid/app/Application;->onLowMemory()V

    .line 153
    return-void
.end method

.method public onTerminate()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 128
    invoke-super {p0}, Landroid/app/Application;->onTerminate()V

    .line 129
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EmagineApplication"

    const-string v2, "onTerminate"

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    sput-object v3, Lcom/disney/emagine/app/EmagineApplication;->app:Lcom/disney/emagine/app/EmagineApplication;

    .line 132
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mLifecycleCallback:Lcom/disney/emagine/app/ActivityLifecycleCallback;

    if-eqz v0, :cond_0

    .line 133
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mLifecycleCallback:Lcom/disney/emagine/app/ActivityLifecycleCallback;

    invoke-virtual {p0, v0}, Lcom/disney/emagine/app/EmagineApplication;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 134
    iput-object v3, p0, Lcom/disney/emagine/app/EmagineApplication;->mLifecycleCallback:Lcom/disney/emagine/app/ActivityLifecycleCallback;

    .line 137
    :cond_0
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mComponentCallbacks:Lcom/disney/emagine/app/ComponentCallbacks;

    if-eqz v0, :cond_1

    .line 138
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mComponentCallbacks:Lcom/disney/emagine/app/ComponentCallbacks;

    invoke-virtual {p0, v0}, Lcom/disney/emagine/app/EmagineApplication;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 139
    iput-object v3, p0, Lcom/disney/emagine/app/EmagineApplication;->mComponentCallbacks:Lcom/disney/emagine/app/ComponentCallbacks;

    .line 141
    :cond_1
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 4
    .param p1, "level"    # I

    .prologue
    .line 157
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mConsole:Lcom/disney/emagine/sdk/EMTConsole;

    const-string v1, "EmagineApplication"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onTrimMemory. level="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {p1}, Lcom/disney/emagine/app/EmagineApplication;->trimLevelToString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/disney/emagine/sdk/EMTConsole;->logi(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    invoke-super {p0, p1}, Landroid/app/Application;->onTrimMemory(I)V

    .line 159
    return-void
.end method

.method public registerCallback(Landroid/os/Handler$Callback;)V
    .locals 1
    .param p1, "callback"    # Landroid/os/Handler$Callback;

    .prologue
    .line 206
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mBackgroundHandler:Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->registerCallback(Landroid/os/Handler$Callback;)V

    .line 207
    return-void
.end method

.method public unregisterCallback(Landroid/os/Handler$Callback;)Z
    .locals 1
    .param p1, "callback"    # Landroid/os/Handler$Callback;

    .prologue
    .line 214
    iget-object v0, p0, Lcom/disney/emagine/app/EmagineApplication;->mBackgroundHandler:Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;

    invoke-virtual {v0, p1}, Lcom/disney/emagine/app/EmagineApplication$ApplicationHandler;->unregisterCallback(Landroid/os/Handler$Callback;)Z

    move-result v0

    return v0
.end method
