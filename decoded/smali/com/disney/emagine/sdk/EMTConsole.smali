.class public Lcom/disney/emagine/sdk/EMTConsole;
.super Ljava/lang/Object;
.source "EMTConsole.java"


# static fields
.field private static final LogLevelResourceName:Ljava/lang/String; = "LOG_LEVEL"

.field private static instance:Lcom/disney/emagine/sdk/EMTConsole;

.field private static logLevel:I


# instance fields
.field private consoleDelegate:Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

.field private mFormatter:Ljava/text/SimpleDateFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const/4 v0, 0x5

    sput v0, Lcom/disney/emagine/sdk/EMTConsole;->logLevel:I

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "HH:mm:ss.SSSS "

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/disney/emagine/sdk/EMTConsole;->mFormatter:Ljava/text/SimpleDateFormat;

    .line 37
    return-void
.end method

.method private consoleDelegate()Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTConsole;->consoleDelegate:Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

    return-object v0
.end method

.method public static sharedInstance()Lcom/disney/emagine/sdk/EMTConsole;
    .locals 2

    .prologue
    .line 65
    sget-object v1, Lcom/disney/emagine/sdk/EMTConsole;->instance:Lcom/disney/emagine/sdk/EMTConsole;

    if-nez v1, :cond_0

    .line 67
    new-instance v1, Lcom/disney/emagine/sdk/EMTConsole;

    invoke-direct {v1}, Lcom/disney/emagine/sdk/EMTConsole;-><init>()V

    sput-object v1, Lcom/disney/emagine/sdk/EMTConsole;->instance:Lcom/disney/emagine/sdk/EMTConsole;

    .line 69
    invoke-static {}, Lcom/disney/emagine/app/EmagineApplication;->app()Lcom/disney/emagine/app/EmagineApplication;

    move-result-object v0

    .line 70
    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 72
    sget-object v1, Lcom/disney/emagine/sdk/EMTConsole;->instance:Lcom/disney/emagine/sdk/EMTConsole;

    invoke-virtual {v1, v0}, Lcom/disney/emagine/sdk/EMTConsole;->setLogLevelFromContext(Landroid/content/Context;)Z

    .line 77
    :cond_0
    sget-object v1, Lcom/disney/emagine/sdk/EMTConsole;->instance:Lcom/disney/emagine/sdk/EMTConsole;

    return-object v1
.end method


# virtual methods
.method public clear()V
    .locals 1

    .prologue
    .line 154
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTConsole;->consoleDelegate:Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

    if-eqz v0, :cond_0

    .line 156
    invoke-direct {p0}, Lcom/disney/emagine/sdk/EMTConsole;->consoleDelegate()Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

    move-result-object v0

    invoke-interface {v0}, Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;->clearConsole()V

    .line 158
    :cond_0
    return-void
.end method

.method public logToConsole(Ljava/lang/String;)V
    .locals 6
    .param p1, "line"    # Ljava/lang/String;

    .prologue
    .line 94
    iget-object v0, p0, Lcom/disney/emagine/sdk/EMTConsole;->consoleDelegate:Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

    if-eqz v0, :cond_0

    sget v0, Lcom/disney/emagine/sdk/EMTConsole;->logLevel:I

    if-gtz v0, :cond_1

    .line 101
    :cond_0
    :goto_0
    return-void

    .line 99
    :cond_1
    invoke-direct {p0}, Lcom/disney/emagine/sdk/EMTConsole;->consoleDelegate()Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/disney/emagine/sdk/EMTConsole;->mFormatter:Ljava/text/SimpleDateFormat;

    new-instance v3, Ljava/util/Date;

    .line 100
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-direct {v3, v4, v5}, Ljava/util/Date;-><init>(J)V

    invoke-virtual {v2, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 99
    invoke-interface {v0, v1}, Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;->updateConsole(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public logd(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 106
    sget v0, Lcom/disney/emagine/sdk/EMTConsole;->logLevel:I

    if-gtz v0, :cond_0

    .line 113
    :goto_0
    return-void

    .line 110
    :cond_0
    invoke-virtual {p0, p2}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 111
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public loge(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 118
    sget v0, Lcom/disney/emagine/sdk/EMTConsole;->logLevel:I

    if-gtz v0, :cond_0

    .line 125
    :goto_0
    return-void

    .line 122
    :cond_0
    invoke-virtual {p0, p2}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 123
    invoke-static {p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public logi(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 130
    sget v0, Lcom/disney/emagine/sdk/EMTConsole;->logLevel:I

    if-gtz v0, :cond_0

    .line 137
    :goto_0
    return-void

    .line 134
    :cond_0
    invoke-virtual {p0, p2}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 135
    invoke-static {p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public logw(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/String;
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 142
    sget v0, Lcom/disney/emagine/sdk/EMTConsole;->logLevel:I

    if-gtz v0, :cond_0

    .line 149
    :goto_0
    return-void

    .line 146
    :cond_0
    invoke-virtual {p0, p2}, Lcom/disney/emagine/sdk/EMTConsole;->logToConsole(Ljava/lang/String;)V

    .line 147
    invoke-static {p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0
.end method

.method public setDelegate(Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;)V
    .locals 0
    .param p1, "delegate"    # Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

    .prologue
    .line 83
    iput-object p1, p0, Lcom/disney/emagine/sdk/EMTConsole;->consoleDelegate:Lcom/disney/emagine/sdk/delegate/EMTConsoleDelegate;

    .line 84
    return-void
.end method

.method public setLogLevelFromContext(Landroid/content/Context;)Z
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 41
    if-nez p1, :cond_1

    .line 60
    :cond_0
    :goto_0
    return v3

    .line 46
    :cond_1
    const/16 v1, 0x8

    .line 48
    .local v1, "level":I
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    const-string v5, "LOG_LEVEL"

    const-string v6, "integer"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v5, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 49
    .local v2, "resId":I
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getInteger(I)I
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 55
    if-ltz v1, :cond_0

    const/4 v4, 0x5

    if-gt v1, v4, :cond_0

    .line 59
    sput v1, Lcom/disney/emagine/sdk/EMTConsole;->logLevel:I

    .line 60
    const/4 v3, 0x1

    goto :goto_0

    .line 50
    .end local v2    # "resId":I
    :catch_0
    move-exception v0

    .line 52
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    goto :goto_0
.end method
