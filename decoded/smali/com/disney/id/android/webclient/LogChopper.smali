.class public Lcom/disney/id/android/webclient/LogChopper;
.super Ljava/lang/Object;
.source "LogChopper.java"


# static fields
.field private static final DEBUG_LEVEL:I = 0x4

.field private static final ERROR_LEVEL:I = 0x1

.field private static final INFO_LEVEL:I = 0x3

.field private static final LogLevelResourceName:Ljava/lang/String; = "LOG_LEVEL"

.field private static final NONE_LEVEL:I = 0x0

.field private static final VERBOSE_LEVEL:I = 0x5

.field private static final WARNING_LEVEL:I = 0x2

.field private static instance:Lcom/disney/id/android/webclient/LogChopper;


# instance fields
.field private LOGGING_ENABLED:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const/4 v0, 0x0

    sput-object v0, Lcom/disney/id/android/webclient/LogChopper;->instance:Lcom/disney/id/android/webclient/LogChopper;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    const/4 v0, 0x5

    iput v0, p0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    .line 24
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 57
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 59
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 61
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 65
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x4

    if-lt v0, v1, :cond_0

    .line 67
    invoke-static {p0, p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    .line 69
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 73
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 75
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 77
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 81
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 83
    invoke-static {p0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    .line 85
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static getInstance()Lcom/disney/id/android/webclient/LogChopper;
    .locals 1

    .prologue
    .line 27
    sget-object v0, Lcom/disney/id/android/webclient/LogChopper;->instance:Lcom/disney/id/android/webclient/LogChopper;

    if-nez v0, :cond_0

    .line 28
    new-instance v0, Lcom/disney/id/android/webclient/LogChopper;

    invoke-direct {v0}, Lcom/disney/id/android/webclient/LogChopper;-><init>()V

    sput-object v0, Lcom/disney/id/android/webclient/LogChopper;->instance:Lcom/disney/id/android/webclient/LogChopper;

    .line 30
    :cond_0
    sget-object v0, Lcom/disney/id/android/webclient/LogChopper;->instance:Lcom/disney/id/android/webclient/LogChopper;

    return-object v0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 89
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 91
    invoke-static {p0, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 93
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 97
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x3

    if-lt v0, v1, :cond_0

    .line 99
    invoke-static {p0, p1, p2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    .line 101
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static setContext(Landroid/content/Context;)Ljava/lang/Boolean;
    .locals 8
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v7, 0x0

    .line 34
    if-nez p0, :cond_0

    .line 36
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    .line 53
    :goto_0
    return-object v3

    .line 39
    :cond_0
    const/4 v1, 0x5

    .line 41
    .local v1, "level":I
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const-string v4, "LOG_LEVEL"

    const-string v5, "integer"

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v2

    .line 42
    .local v2, "resId":I
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/content/res/Resources;->getInteger(I)I
    :try_end_0
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v1

    .line 48
    if-ltz v1, :cond_1

    const/4 v3, 0x5

    if-le v1, v3, :cond_2

    .line 50
    :cond_1
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0

    .line 43
    .end local v2    # "resId":I
    :catch_0
    move-exception v0

    .line 45
    .local v0, "e":Landroid/content/res/Resources$NotFoundException;
    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0

    .line 52
    .end local v0    # "e":Landroid/content/res/Resources$NotFoundException;
    .restart local v2    # "resId":I
    :cond_2
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v3

    iput v1, v3, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    .line 53
    const/4 v3, 0x1

    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    goto :goto_0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 105
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 107
    invoke-static {p0, p1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 109
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 113
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x5

    if-lt v0, v1, :cond_0

    .line 115
    invoke-static {p0, p1, p2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    .line 117
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 121
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 123
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 125
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 129
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x2

    if-lt v0, v1, :cond_0

    .line 131
    invoke-static {p0, p1, p2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    .line 133
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static wtf(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 137
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 139
    invoke-static {p0, p1}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 141
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    .locals 2
    .param p0, "TAG"    # Ljava/lang/String;
    .param p1, "msg"    # Ljava/lang/String;
    .param p2, "tr"    # Ljava/lang/Throwable;

    .prologue
    .line 145
    invoke-static {}, Lcom/disney/id/android/webclient/LogChopper;->getInstance()Lcom/disney/id/android/webclient/LogChopper;

    move-result-object v0

    iget v0, v0, Lcom/disney/id/android/webclient/LogChopper;->LOGGING_ENABLED:I

    const/4 v1, 0x1

    if-lt v0, v1, :cond_0

    .line 147
    invoke-static {p0, p1, p2}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    .line 149
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
