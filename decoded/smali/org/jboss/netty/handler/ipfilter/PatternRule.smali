.class public Lorg/jboss/netty/handler/ipfilter/PatternRule;
.super Ljava/lang/Object;
.source "PatternRule.java"

# interfaces
.implements Lorg/jboss/netty/handler/ipfilter/IpFilterRule;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lorg/jboss/netty/handler/ipfilter/IpFilterRule;",
        "Ljava/lang/Comparable",
        "<",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation


# static fields
.field private static final logger:Lorg/jboss/netty/logging/InternalLogger;


# instance fields
.field private ipPattern:Ljava/util/regex/Pattern;

.field private isAllowRule:Z

.field private localhost:Z

.field private namePattern:Ljava/util/regex/Pattern;

.field private final pattern:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-class v0, Lorg/jboss/netty/handler/ipfilter/PatternRule;

    invoke-static {v0}, Lorg/jboss/netty/logging/InternalLoggerFactory;->getInstance(Ljava/lang/Class;)Lorg/jboss/netty/logging/InternalLogger;

    move-result-object v0

    sput-object v0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->logger:Lorg/jboss/netty/logging/InternalLogger;

    return-void
.end method

.method public constructor <init>(ZLjava/lang/String;)V
    .locals 1
    .param p1, "allow"    # Z
    .param p2, "pattern"    # Ljava/lang/String;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 58
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->isAllowRule:Z

    .line 71
    iput-boolean p1, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->isAllowRule:Z

    .line 72
    iput-object p2, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->pattern:Ljava/lang/String;

    .line 73
    invoke-direct {p0, p2}, Lorg/jboss/netty/handler/ipfilter/PatternRule;->parse(Ljava/lang/String;)V

    .line 74
    return-void
.end method

.method private static addRule(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "pattern"    # Ljava/lang/String;
    .param p1, "rule"    # Ljava/lang/String;

    .prologue
    .line 140
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    if-nez v0, :cond_1

    .line 150
    :cond_0
    :goto_0
    return-object p0

    .line 143
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_2

    .line 144
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "|"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 146
    :cond_2
    const-string v0, "\\."

    const-string v1, "\\\\."

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 147
    const-string v0, "\\*"

    const-string v1, ".*"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 148
    const-string v0, "\\?"

    const-string v1, "."

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 150
    goto :goto_0
.end method

.method private static isLocalhost(Ljava/net/InetAddress;)Z
    .locals 9
    .param p0, "address"    # Ljava/net/InetAddress;

    .prologue
    const/4 v6, 0x1

    .line 155
    :try_start_0
    invoke-static {}, Ljava/net/InetAddress;->getLocalHost()Ljava/net/InetAddress;

    move-result-object v7

    invoke-virtual {p0, v7}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v7

    if-eqz v7, :cond_1

    .line 175
    :cond_0
    :goto_0
    return v6

    .line 158
    :catch_0
    move-exception v3

    .line 159
    .local v3, "e":Ljava/net/UnknownHostException;
    sget-object v7, Lorg/jboss/netty/handler/ipfilter/PatternRule;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v7}, Lorg/jboss/netty/logging/InternalLogger;->isInfoEnabled()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 160
    sget-object v7, Lorg/jboss/netty/handler/ipfilter/PatternRule;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v8, "error getting ip of localhost"

    invoke-interface {v7, v8, v3}, Lorg/jboss/netty/logging/InternalLogger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 164
    .end local v3    # "e":Ljava/net/UnknownHostException;
    :cond_1
    :try_start_1
    const-string v7, "127.0.0.1"

    invoke-static {v7}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object v1

    .line 165
    .local v1, "addrs":[Ljava/net/InetAddress;
    move-object v2, v1

    .local v2, "arr$":[Ljava/net/InetAddress;
    array-length v5, v2

    .local v5, "len$":I
    const/4 v4, 0x0

    .local v4, "i$":I
    :goto_1
    if-ge v4, v5, :cond_2

    aget-object v0, v2, v4

    .line 166
    .local v0, "addr":Ljava/net/InetAddress;
    invoke-virtual {v0, p0}, Ljava/net/InetAddress;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_1

    move-result v7

    if-nez v7, :cond_0

    .line 165
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 170
    .end local v0    # "addr":Ljava/net/InetAddress;
    .end local v1    # "addrs":[Ljava/net/InetAddress;
    .end local v2    # "arr$":[Ljava/net/InetAddress;
    .end local v4    # "i$":I
    .end local v5    # "len$":I
    :catch_1
    move-exception v3

    .line 171
    .restart local v3    # "e":Ljava/net/UnknownHostException;
    sget-object v6, Lorg/jboss/netty/handler/ipfilter/PatternRule;->logger:Lorg/jboss/netty/logging/InternalLogger;

    invoke-interface {v6}, Lorg/jboss/netty/logging/InternalLogger;->isInfoEnabled()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 172
    sget-object v6, Lorg/jboss/netty/handler/ipfilter/PatternRule;->logger:Lorg/jboss/netty/logging/InternalLogger;

    const-string v7, "error getting ip of localhost"

    invoke-interface {v6, v7, v3}, Lorg/jboss/netty/logging/InternalLogger;->info(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 175
    .end local v3    # "e":Ljava/net/UnknownHostException;
    :cond_2
    const/4 v6, 0x0

    goto :goto_0
.end method

.method private parse(Ljava/lang/String;)V
    .locals 9
    .param p1, "pattern"    # Ljava/lang/String;

    .prologue
    const/4 v8, 0x2

    .line 113
    if-nez p1, :cond_1

    .line 137
    :cond_0
    :goto_0
    return-void

    .line 117
    :cond_1
    const/16 v7, 0x2c

    invoke-static {p1, v7}, Lorg/jboss/netty/util/internal/StringUtil;->split(Ljava/lang/String;C)[Ljava/lang/String;

    move-result-object v0

    .line 119
    .local v0, "acls":[Ljava/lang/String;
    const-string v4, ""

    .line 120
    .local v4, "ip":Ljava/lang/String;
    const-string v6, ""

    .line 121
    .local v6, "name":Ljava/lang/String;
    move-object v1, v0

    .local v1, "arr$":[Ljava/lang/String;
    array-length v5, v1

    .local v5, "len$":I
    const/4 v3, 0x0

    .local v3, "i$":I
    :goto_1
    if-ge v3, v5, :cond_5

    aget-object v2, v1, v3

    .line 122
    .local v2, "c":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 123
    const-string v7, "n:localhost"

    invoke-virtual {v7, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_3

    .line 124
    const/4 v7, 0x1

    iput-boolean v7, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->localhost:Z

    .line 121
    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 125
    :cond_3
    const-string v7, "n:"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_4

    .line 126
    invoke-virtual {v2, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lorg/jboss/netty/handler/ipfilter/PatternRule;->addRule(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 127
    :cond_4
    const-string v7, "i:"

    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 128
    invoke-virtual {v2, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v4, v7}, Lorg/jboss/netty/handler/ipfilter/PatternRule;->addRule(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    .line 131
    .end local v2    # "c":Ljava/lang/String;
    :cond_5
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_6

    .line 132
    invoke-static {v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    iput-object v7, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->ipPattern:Ljava/util/regex/Pattern;

    .line 134
    :cond_6
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_0

    .line 135
    invoke-static {v6}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v7

    iput-object v7, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->namePattern:Ljava/util/regex/Pattern;

    goto :goto_0
.end method


# virtual methods
.method public compareTo(Ljava/lang/Object;)I
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, -0x1

    .line 179
    if-nez p1, :cond_1

    .line 195
    :cond_0
    :goto_0
    return v1

    .line 182
    :cond_1
    instance-of v2, p1, Lorg/jboss/netty/handler/ipfilter/PatternRule;

    if-eqz v2, :cond_0

    move-object v0, p1

    .line 185
    check-cast v0, Lorg/jboss/netty/handler/ipfilter/PatternRule;

    .line 186
    .local v0, "p":Lorg/jboss/netty/handler/ipfilter/PatternRule;
    invoke-virtual {v0}, Lorg/jboss/netty/handler/ipfilter/PatternRule;->isAllowRule()Z

    move-result v2

    if-eqz v2, :cond_2

    iget-boolean v2, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->isAllowRule:Z

    if-eqz v2, :cond_0

    .line 189
    :cond_2
    iget-object v2, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->pattern:Ljava/lang/String;

    if-nez v2, :cond_3

    iget-object v2, v0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->pattern:Ljava/lang/String;

    if-nez v2, :cond_3

    .line 190
    const/4 v1, 0x0

    goto :goto_0

    .line 192
    :cond_3
    iget-object v2, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->pattern:Ljava/lang/String;

    if-eqz v2, :cond_0

    .line 193
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->pattern:Ljava/lang/String;

    invoke-virtual {v0}, Lorg/jboss/netty/handler/ipfilter/PatternRule;->getPattern()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v1

    goto :goto_0
.end method

.method public contains(Ljava/net/InetAddress;)Z
    .locals 3
    .param p1, "inetAddress"    # Ljava/net/InetAddress;

    .prologue
    const/4 v0, 0x1

    .line 94
    iget-boolean v1, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->localhost:Z

    if-eqz v1, :cond_1

    .line 95
    invoke-static {p1}, Lorg/jboss/netty/handler/ipfilter/PatternRule;->isLocalhost(Ljava/net/InetAddress;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 109
    :cond_0
    :goto_0
    return v0

    .line 99
    :cond_1
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->ipPattern:Ljava/util/regex/Pattern;

    if-eqz v1, :cond_2

    .line 100
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->ipPattern:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_0

    .line 104
    :cond_2
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->namePattern:Ljava/util/regex/Pattern;

    if-eqz v1, :cond_3

    .line 105
    iget-object v1, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->namePattern:Ljava/util/regex/Pattern;

    invoke-virtual {p1}, Ljava/net/InetAddress;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v1

    if-nez v1, :cond_0

    .line 109
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getPattern()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->pattern:Ljava/lang/String;

    return-object v0
.end method

.method public isAllowRule()Z
    .locals 1

    .prologue
    .line 86
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->isAllowRule:Z

    return v0
.end method

.method public isDenyRule()Z
    .locals 1

    .prologue
    .line 90
    iget-boolean v0, p0, Lorg/jboss/netty/handler/ipfilter/PatternRule;->isAllowRule:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
