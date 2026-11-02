.class public Lcom/disneymobile/mocha/NSObject;
.super Ljava/lang/Object;
.source "NSObject.java"


# instance fields
.field protected logPrefix:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    const-string v0, ""

    iput-object v0, p0, Lcom/disneymobile/mocha/NSObject;->logPrefix:Ljava/lang/String;

    return-void
.end method

.method public static JSONStringFromValue(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2
    .param p0, "val"    # Ljava/lang/Object;

    .prologue
    .line 104
    instance-of v0, p0, Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 105
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    check-cast p0, Ljava/lang/String;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 123
    .restart local p0    # "val":Ljava/lang/Object;
    :goto_0
    return-object v0

    .line 107
    :cond_0
    instance-of v0, p0, Ljava/util/HashMap;

    if-eqz v0, :cond_1

    .line 108
    check-cast p0, Ljava/util/HashMap;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-static {p0}, Lcom/disneymobile/mocha/Utilities;->JSONStringFromDictionary(Ljava/util/HashMap;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 110
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, [Ljava/lang/Object;

    if-eqz v0, :cond_2

    .line 111
    check-cast p0, [Ljava/lang/Object;

    .end local p0    # "val":Ljava/lang/Object;
    check-cast p0, [Ljava/lang/Object;

    invoke-static {p0}, Lcom/disneymobile/mocha/Utilities;->JSONStringFromArray([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 113
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_2
    instance-of v0, p0, Ljava/lang/Integer;

    if-eqz v0, :cond_3

    .line 114
    check-cast p0, Ljava/lang/Integer;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 116
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_3
    instance-of v0, p0, Ljava/lang/Double;

    if-eqz v0, :cond_4

    .line 117
    check-cast p0, Ljava/lang/Double;

    .end local p0    # "val":Ljava/lang/Object;
    invoke-virtual {p0}, Ljava/lang/Double;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 119
    .restart local p0    # "val":Ljava/lang/Object;
    :cond_4
    if-nez p0, :cond_5

    .line 120
    const-string v0, "null"

    goto :goto_0

    .line 123
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "\""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public static methodSignatureForSelector(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;)Lcom/disneymobile/mocha/NSMethodSignature;
    .locals 6
    .param p0, "_this"    # Ljava/lang/Object;
    .param p1, "action"    # Lcom/disneymobile/mocha/support/Selector;

    .prologue
    .line 87
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v0

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v2, v0

    .local v2, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v2, :cond_1

    aget-object v3, v0, v1

    .line 88
    .local v3, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v3}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/disneymobile/mocha/support/Selector;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 89
    new-instance v4, Lcom/disneymobile/mocha/NSMethodSignature;

    invoke-direct {v4, v3}, Lcom/disneymobile/mocha/NSMethodSignature;-><init>(Ljava/lang/reflect/Method;)V

    .line 91
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :goto_1
    return-object v4

    .line 87
    .restart local v3    # "method":Ljava/lang/reflect/Method;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 91
    .end local v3    # "method":Ljava/lang/reflect/Method;
    :cond_1
    const/4 v4, 0x0

    goto :goto_1
.end method

.method public static performSelectorInBackgroundWithObject(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)V
    .locals 2
    .param p0, "_this"    # Ljava/lang/Object;
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 99
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p2, v0, v1

    invoke-virtual {p1, p0, v0}, Lcom/disneymobile/mocha/support/Selector;->invokeInBackground(Ljava/lang/Object;[Ljava/lang/Object;)V

    .line 100
    return-void
.end method

.method public static performSelectorOnMainThreadWithObjectAfterDelay(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;F)V
    .locals 4
    .param p0, "_this"    # Ljava/lang/Object;
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "seconds"    # F

    .prologue
    .line 29
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/disneymobile/mocha/NSObject$1;

    invoke-direct {v1, p2, p1, p0}, Lcom/disneymobile/mocha/NSObject$1;-><init>(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)V

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float/2addr v2, p3

    float-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 37
    return-void
.end method

.method public static performSelectorOnMainThreadWithObjectAndWaitUntilDone(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Z)V
    .locals 3
    .param p0, "_this"    # Ljava/lang/Object;
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "waitUntilDone"    # Z

    .prologue
    .line 44
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 46
    .local v0, "latch":Ljava/util/concurrent/CountDownLatch;
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Lcom/disneymobile/mocha/NSObject$2;

    invoke-direct {v2, p2, p1, p0, v0}, Lcom/disneymobile/mocha/NSObject$2;-><init>(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Ljava/util/concurrent/CountDownLatch;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 56
    if-eqz p3, :cond_0

    .line 58
    :try_start_0
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :cond_0
    :goto_0
    return-void

    .line 59
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method public static performSelectorWithObject(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p0, "_this"    # Ljava/lang/Object;
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 69
    const/4 v0, 0x0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {p1, v0, p0, v1}, Lcom/disneymobile/mocha/support/Selector;->invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public static performSelectorWithObjectAfterDelay(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;D)V
    .locals 5
    .param p0, "_this"    # Ljava/lang/Object;
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "delayS"    # D

    .prologue
    .line 78
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/disneymobile/mocha/NSObject$3;

    invoke-direct {v1, p1, p0, p2}, Lcom/disneymobile/mocha/NSObject$3;-><init>(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Ljava/lang/Object;)V

    const-wide v2, 0x408f400000000000L    # 1000.0

    mul-double/2addr v2, p3

    double-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 84
    return-void
.end method


# virtual methods
.method public getLogPrefix()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/disneymobile/mocha/NSObject;->logPrefix:Ljava/lang/String;

    return-object v0
.end method

.method public performSelectorInBackgroundWithObject(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)V
    .locals 0
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 95
    invoke-static {p0, p1, p2}, Lcom/disneymobile/mocha/NSObject;->performSelectorInBackgroundWithObject(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)V

    .line 96
    return-void
.end method

.method public performSelectorOnMainThreadWithObjectAfterDelay(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;F)V
    .locals 0
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "seconds"    # F

    .prologue
    .line 25
    invoke-static {p0, p1, p2, p3}, Lcom/disneymobile/mocha/NSObject;->performSelectorOnMainThreadWithObjectAfterDelay(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;F)V

    .line 26
    return-void
.end method

.method public performSelectorOnMainThreadWithObjectAndWaitUntilDone(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Z)V
    .locals 0
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "userInfo"    # Ljava/lang/Object;
    .param p3, "waitUntilDone"    # Z

    .prologue
    .line 40
    invoke-static {p0, p1, p2, p3}, Lcom/disneymobile/mocha/NSObject;->performSelectorOnMainThreadWithObjectAndWaitUntilDone(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;Z)V

    .line 41
    return-void
.end method

.method public performSelectorWithObject(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 65
    invoke-static {p0, p1, p2}, Lcom/disneymobile/mocha/NSObject;->performSelectorWithObject(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public performSelectorWithObjectAfterDelay(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;D)V
    .locals 1
    .param p1, "selector"    # Lcom/disneymobile/mocha/support/Selector;
    .param p2, "object"    # Ljava/lang/Object;
    .param p3, "delayS"    # D

    .prologue
    .line 73
    invoke-static {p0, p1, p2, p3, p4}, Lcom/disneymobile/mocha/NSObject;->performSelectorWithObjectAfterDelay(Ljava/lang/Object;Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;D)V

    .line 74
    return-void
.end method

.method public setLogPrefix(Ljava/lang/String;)V
    .locals 0
    .param p1, "prefix"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/disneymobile/mocha/NSObject;->logPrefix:Ljava/lang/String;

    .line 22
    return-void
.end method
