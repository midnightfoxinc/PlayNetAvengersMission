.class public Lcom/disneymobile/mocha/support/Selector;
.super Lcom/disneymobile/mocha/NSObject;
.source "Selector.java"


# static fields
.field private static backgroundService:Ljava/util/concurrent/ExecutorService;


# instance fields
.field private final name:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/util/concurrent/Executors;->newFixedThreadPool(I)Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Lcom/disneymobile/mocha/support/Selector;->backgroundService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0}, Lcom/disneymobile/mocha/NSObject;-><init>()V

    .line 24
    iput-object p1, p0, Lcom/disneymobile/mocha/support/Selector;->name:Ljava/lang/String;

    .line 25
    return-void
.end method

.method private varargs invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 7
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "method"    # Ljava/lang/reflect/Method;
    .param p4, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;",
            "Ljava/lang/Object;",
            "Ljava/lang/reflect/Method;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/16 v6, -0x834

    .line 104
    :try_start_0
    invoke-virtual {p3, p2, p4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v3

    .line 113
    if-eqz p1, :cond_0

    .line 114
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 115
    .local v2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "kNSErrorLocalizedFailureReasonErrorKey"

    const-string v5, "An exception occurred when calling method.invoke()."

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string v4, "kMochaDomain"

    invoke-static {v4, v6, v2}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    .line 117
    .local v1, "error":Lcom/disneymobile/mocha/NSError;
    invoke-virtual {p1, v1}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 118
    .end local v1    # "error":Lcom/disneymobile/mocha/NSError;
    .end local v2    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    return-object v3

    .line 105
    :catch_0
    move-exception v0

    .line 106
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    :try_start_1
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catchall_0
    move-exception v3

    if-eqz p1, :cond_1

    .line 114
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 115
    .restart local v2    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v4, "kNSErrorLocalizedFailureReasonErrorKey"

    const-string v5, "An exception occurred when calling method.invoke()."

    invoke-virtual {v2, v4, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    const-string v4, "kMochaDomain"

    invoke-static {v4, v6, v2}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v1

    .line 117
    .restart local v1    # "error":Lcom/disneymobile/mocha/NSError;
    invoke-virtual {p1, v1}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 118
    .end local v1    # "error":Lcom/disneymobile/mocha/NSError;
    .end local v2    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_1
    throw v3

    .line 107
    :catch_1
    move-exception v0

    .line 108
    .local v0, "e":Ljava/lang/IllegalAccessException;
    :try_start_2
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3

    .line 109
    .end local v0    # "e":Ljava/lang/IllegalAccessException;
    :catch_2
    move-exception v0

    .line 110
    .local v0, "e":Ljava/lang/reflect/InvocationTargetException;
    new-instance v3, Ljava/lang/IllegalStateException;

    invoke-direct {v3, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/Throwable;)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0
.end method

.method private varargs tryInvokeWithError(Lcom/disneymobile/mocha/support/Out;ZLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6
    .param p2, "throwOnFailure"    # Z
    .param p3, "target"    # Ljava/lang/Object;
    .param p4, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;Z",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 82
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    invoke-direct {p0, p1, p3, p4}, Lcom/disneymobile/mocha/support/Selector;->tryResolveSelectorByValuesWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v1

    .line 83
    .local v1, "method":Ljava/lang/reflect/Method;
    if-nez v1, :cond_2

    .line 85
    if-eqz p1, :cond_0

    .line 86
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 87
    .local v2, "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const-string v3, "kNSErrorLocalizedFailureReasonErrorKey"

    const-string v4, "Could not resolve selector by values."

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    const-string v3, "kMochaDomain"

    const/16 v4, -0x835

    invoke-static {v3, v4, v2}, Lcom/disneymobile/mocha/NSError;->errorWithDomainCodeAndUserInfo(Ljava/lang/String;ILjava/util/HashMap;)Lcom/disneymobile/mocha/NSError;

    move-result-object v0

    .line 89
    .local v0, "error":Lcom/disneymobile/mocha/NSError;
    invoke-virtual {p1, v0}, Lcom/disneymobile/mocha/support/Out;->setValue(Ljava/lang/Object;)V

    .line 91
    .end local v0    # "error":Lcom/disneymobile/mocha/NSError;
    .end local v2    # "userInfo":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    :cond_0
    if-eqz p2, :cond_1

    .line 92
    new-instance v3, Ljava/lang/IllegalStateException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " does not respond to selector "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/disneymobile/mocha/support/Selector;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 94
    :cond_1
    invoke-virtual {p0}, Lcom/disneymobile/mocha/support/Selector;->getLogPrefix()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " does not respond to selector "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/disneymobile/mocha/support/Selector;->name:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ": "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    const/4 v3, 0x0

    .line 99
    :goto_0
    return-object v3

    :cond_2
    invoke-direct {p0, p1, p3, v1, p4}, Lcom/disneymobile/mocha/support/Selector;->invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;Ljava/lang/reflect/Method;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    goto :goto_0
.end method

.method private varargs tryResolveSelectorByTypesWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 10
    .param p2, "target"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Class",
            "<*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 130
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    .local p3, "parameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Class;->getMethods()[Ljava/lang/reflect/Method;

    move-result-object v6

    .line 132
    .local v6, "methods":[Ljava/lang/reflect/Method;
    move-object v0, v6

    .local v0, "arr$":[Ljava/lang/reflect/Method;
    array-length v3, v0

    .local v3, "len$":I
    const/4 v2, 0x0

    .local v2, "i$":I
    :goto_0
    if-ge v2, v3, :cond_5

    aget-object v4, v0, v2

    .line 133
    .local v4, "method":Ljava/lang/reflect/Method;
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getName()Ljava/lang/String;

    move-result-object v8

    iget-object v9, p0, Lcom/disneymobile/mocha/support/Selector;->name:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_1

    .line 132
    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 136
    :cond_1
    invoke-virtual {v4}, Ljava/lang/reflect/Method;->getParameterTypes()[Ljava/lang/Class;

    move-result-object v5

    .line 137
    .local v5, "methodParameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    array-length v8, v5

    array-length v9, p3

    if-ne v8, v9, :cond_0

    .line 140
    const/4 v7, 0x1

    .line 141
    .local v7, "parametersTypesMatch":Z
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    array-length v8, v5

    if-ge v1, v8, :cond_4

    .line 142
    aget-object v8, p3, v1

    if-nez v8, :cond_3

    .line 141
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 144
    :cond_3
    aget-object v8, v5, v1

    aget-object v9, p3, v1

    invoke-virtual {v8, v9}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v8

    if-nez v8, :cond_2

    .line 145
    const/4 v7, 0x0

    .line 150
    :cond_4
    if-eqz v7, :cond_0

    .line 177
    .end local v1    # "i":I
    .end local v4    # "method":Ljava/lang/reflect/Method;
    .end local v5    # "methodParameterTypes":[Ljava/lang/Class;, "[Ljava/lang/Class<*>;"
    .end local v7    # "parametersTypesMatch":Z
    :goto_2
    return-object v4

    :cond_5
    const/4 v4, 0x0

    goto :goto_2
.end method

.method private varargs tryResolveSelectorByValuesWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/reflect/Method;
    .locals 3
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .prologue
    .line 123
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    new-instance v1, Ljava/util/ArrayList;

    array-length v2, p3

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 124
    .local v1, "parameterTypes":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Class<*>;>;"
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v2, p3

    if-ge v0, v2, :cond_1

    .line 125
    aget-object v2, p3, v0

    if-eqz v2, :cond_0

    aget-object v2, p3, v0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    :goto_1
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 124
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 125
    :cond_0
    const/4 v2, 0x0

    goto :goto_1

    .line 126
    :cond_1
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Class;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/Class;

    invoke-direct {p0, p1, p2, v2}, Lcom/disneymobile/mocha/support/Selector;->tryResolveSelectorByTypesWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    return-object v2
.end method


# virtual methods
.method public getName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/disneymobile/mocha/support/Selector;->name:Ljava/lang/String;

    return-object v0
.end method

.method public varargs invokeIfRespondsToSelectorWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 70
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/disneymobile/mocha/support/Selector;->tryInvokeWithError(Lcom/disneymobile/mocha/support/Out;ZLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public varargs invokeInBackground(Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "parameters"    # [Ljava/lang/Object;

    .prologue
    .line 32
    sget-object v0, Lcom/disneymobile/mocha/support/Selector;->backgroundService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/disneymobile/mocha/support/Selector$1;

    invoke-direct {v1, p0, p1, p2}, Lcom/disneymobile/mocha/support/Selector$1;-><init>(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 46
    return-void
.end method

.method public varargs invokeInBackgroundIfRespondsToSelector(Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 2
    .param p1, "target"    # Ljava/lang/Object;
    .param p2, "parameters"    # [Ljava/lang/Object;

    .prologue
    .line 49
    sget-object v0, Lcom/disneymobile/mocha/support/Selector;->backgroundService:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Lcom/disneymobile/mocha/support/Selector$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/disneymobile/mocha/support/Selector$2;-><init>(Lcom/disneymobile/mocha/support/Selector;Ljava/lang/Object;[Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 63
    return-void
.end method

.method public varargs invokeWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 66
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0, p2, p3}, Lcom/disneymobile/mocha/support/Selector;->tryInvokeWithError(Lcom/disneymobile/mocha/support/Out;ZLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public varargs invokeWithOptionalParametersWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p2, "target"    # Ljava/lang/Object;
    .param p3, "parameters"    # [Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/disneymobile/mocha/support/Out",
            "<",
            "Lcom/disneymobile/mocha/NSError;",
            ">;",
            "Ljava/lang/Object;",
            "[",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .local p1, "outError":Lcom/disneymobile/mocha/support/Out;, "Lcom/disneymobile/mocha/support/Out<Lcom/disneymobile/mocha/NSError;>;"
    const/4 v2, 0x1

    .line 74
    invoke-direct {p0, p1, p2, p3}, Lcom/disneymobile/mocha/support/Selector;->tryResolveSelectorByValuesWithError(Lcom/disneymobile/mocha/support/Out;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 75
    .local v0, "method":Ljava/lang/reflect/Method;
    if-eqz v0, :cond_0

    .line 76
    invoke-direct {p0, p1, v2, p2, p3}, Lcom/disneymobile/mocha/support/Selector;->tryInvokeWithError(Lcom/disneymobile/mocha/support/Out;ZLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 78
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-direct {p0, p1, v2, p2, v1}, Lcom/disneymobile/mocha/support/Selector;->tryInvokeWithError(Lcom/disneymobile/mocha/support/Out;ZLjava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    goto :goto_0
.end method
